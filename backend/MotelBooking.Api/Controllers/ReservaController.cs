using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Authorize] // � Requer autenticação JWT
[Route("api/reservas")]
[ApiController]
public class ReservaController : ControllerBase
{
    private readonly IReservaService _reservaService;

    public ReservaController(IReservaService reservaService)
    {
        _reservaService = reservaService;
    }

    // � Criar nova reserva
    [HttpPost]
    public IActionResult CriarReserva([FromBody] ReservaDto reserva)
    {
        var result = _reservaService.CriarReserva(reserva);
        if (!result.Sucesso)
            return BadRequest(result.Mensagem);

        return Ok(new { mensagem = "Reserva criada com sucesso!" });
    }

    // � Listar reservas filtradas por data
    [HttpGet]
    public IActionResult ListarReservas([FromQuery] DateTime dataInicio, [FromQuery] DateTime dataFim)
    {
        var reservas = _reservaService.ListarReservas(dataInicio, dataFim);
        return Ok(reservas);
    }

    // � Obter faturamento mensal
    [HttpGet("faturamento")]
    public IActionResult ObterFaturamento([FromQuery] int ano, [FromQuery] int mes)
    {
        var faturamento = _reservaService.ObterFaturamento(ano, mes);
        return Ok(new { ano, mes, total = faturamento });
    }
}
