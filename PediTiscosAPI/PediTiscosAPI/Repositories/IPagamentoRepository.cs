using PediTiscosAPI.Entities;

public interface IPagamentoRepository
{
    Task<Pagamento> CriarPagamentoAsync(CriarPagamentoRequest request);
    Task<Pagamento> ObterPagamentoPorIdAsync(int id); 
}
