namespace PediTiscosAPI.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using PediTiscosAPI.Data;
    using PediTiscosAPI.Entities;

    [Route("api/[controller]")]
    [ApiController]
    public class ProdutosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ProdutosController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetProdutos()
        {
            var produtos = _context.Produtos.ToList();
            return Ok(produtos);
        }

        //[HttpPost]
        //public IActionResult AddProduto(Produto produto)
        //{
        //    _context.Produtos.Add(produto);
        //    _context.SaveChanges();
        //    return CreatedAtAction(nameof(GetProdutos), new { id = produto.Id }, produto);
        //}
    }

}
