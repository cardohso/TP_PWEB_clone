using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RCLAPI.DTO
{
    public class RegisterModel
    {
        public string Nome { get; set; }
        public string Apelido { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public long? NIF { get; set; }
    }
}
