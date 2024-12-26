using Microsoft.AspNetCore.Identity;

namespace GestãoLoja.Entities
{
    public class ApplicationUser : IdentityUser
    {
        public string Nome { get; set; }
        public string Apelido { get; set; }
        public string NIF { get; set; }
        public string Rua { get; set; }
        public string Localidade1 { get; set; }
        public string Localidade2 { get; set; }
        public string Pais { get; set; }

    }

}