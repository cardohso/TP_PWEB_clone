using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RCLAPI.DTO;

// Add profile data for application users by adding properties to the ApplicationUser class
public class Utilizador
{
    [Required, EmailAddress]
    public string Email { get; set; }

    [Required, MinLength(6)]
    public string Password { get; set; }

    [Required]
    public string Nome { get; set; }

    [Required]
    public string Apelido { get; set; }

    public String NIF { get; set; }
    public string? Rua { get; set; }
    public string? Localidade1 { get; set; }
    public string? Localidade2 { get; set; }
    public string? Pais { get; set; }
}
