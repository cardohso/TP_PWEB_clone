using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using PediTiscosAPI.Entities;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PediTiscosAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;

        public AuthController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Register([FromBody] Utilizador utilizador)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var existingUser = await _userManager.FindByEmailAsync(utilizador.Email);
            if (existingUser != null)
            {
                return BadRequest("O email já se encontra em uso.");
            }

            var newUser = new ApplicationUser
            {
                UserName = utilizador.Email,
                Email = utilizador.Email,
                Nome = utilizador.Nome,
                Apelido = utilizador.Apelido,
                NIF = utilizador.NIF,
                Rua = utilizador.Rua,
                Localidade1 = utilizador.Localidade1,
                Localidade2 = utilizador.Localidade2,
                Pais = utilizador.Pais,
                EmailConfirmed = true,
                PhoneNumberConfirmed = true
            };

            var result = await _userManager.CreateAsync(newUser, utilizador.Password);
            if (!result.Succeeded)
            {
                return BadRequest(result.Errors);
            }

            await _userManager.AddToRoleAsync(newUser, "CLIENTE");  // Atribuindo a função "Cliente"

            return StatusCode(StatusCodes.Status201Created);  // Retorna status 201 de sucesso
        }

        // Endpoint para login do usuário e geração do token JWT
        [HttpPost("login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var user = await _userManager.FindByEmailAsync(model.Email);
            if (user == null)
                return NotFound("Usuário não encontrado.");

            var result = await _signInManager.PasswordSignInAsync(user, model.Password, false, lockoutOnFailure: false);
            if (!result.Succeeded)
            {
                return Unauthorized("Login inválido.");
            }

            var userRoles = await _userManager.GetRolesAsync(user);

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.NameIdentifier, user.Id),
                new Claim(ClaimTypes.Name, user.Nome)
            };

            claims.AddRange(userRoles.Select(role => new Claim(ClaimTypes.Role, role)));

            var token = new JwtSecurityToken(
                issuer: _configuration["JWT:Issuer"],
                audience: _configuration["JWT:Audience"],
                claims: claims,
                expires: DateTime.Now.AddDays(30),
                signingCredentials: credentials
            );

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return Ok(new
            {
                accessToken = jwt,
                tokenType = "bearer",
                userId = user.Id,
                userName = user.Nome
            });
        }
    }
}