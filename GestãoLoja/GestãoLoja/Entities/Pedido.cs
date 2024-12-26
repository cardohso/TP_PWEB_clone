namespace GestãoLoja.Entities


    {
        public class Pedido
        {
            public int Id { get; set; }
            public DateTime Data { get; set; } // Data do pedido
            public string ClienteId { get; set; } // Relacionamento com o cliente (ou ID)
            public string Status { get; set; } = "Pendente"; // Pendente, Concluído, Cancelado
            public decimal Total { get; set; } // Total do pedido
            public Cliente Cliente { get; set; } // Navegação para obter o nome

        // Relacionamento com os itens do pedido
        public ICollection<ItemPedido> Itens { get; set; } = new List<ItemPedido>();
        }

        public class ItemPedido
        {
            public int Id { get; set; }
            public int PedidoId { get; set; } // Chave estrangeira para o Pedido
            public Pedido Pedido { get; set; }
        public string ProdutoNome { get; set; } // Nome do Produto

        public int ProdutoId { get; set; } // Chave estrangeira para o Produto
            public Produto Produto { get; set; }

            public int Quantidade { get; set; } // Quantidade de produtos no pedido
            public decimal PrecoUnitario { get; set; } // Preço do produto no momento do pedido
        }
    }

