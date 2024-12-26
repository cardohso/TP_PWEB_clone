using System.ComponentModel.DataAnnotations;

namespace PediTiscosAPI.Entities
{
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
}
