using System.ComponentModel.DataAnnotations.Schema;

namespace GestãoLoja.Entities
{
    public class Categoria
    {
        public int Id { get; set; }
        public string Nome { get; set; }
    }
}
