using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Authorize] // � Protege os endpoints para usuários autenticados
[Route("api/moteis")]
[ApiController]
public class MotelController : ControllerBase
{
    private readonly IMotelService _motelService;

    public MotelController(IMotelService motelService)
    {
        _motelService = motelService;
    }

    // � Criar um novo motel
    [HttpPost]
    public IActionResult CriarMotel([FromBody] MotelDto motelDto)
    {
        var result = _motelService.CriarMotel(motelDto);
        if (!result.Sucesso)
            return BadRequest(result.Mensagem);

        return Ok(new { mensagem = "Motel cadastrado com sucesso!" });
    }

    // � Listar todos os motéis
    [HttpGet]
    public IActionResult ListarMoteis()
    {
        var moteis = _motelService.ListarMoteis();
        return Ok(moteis);
    }

    // � Obter detalhes de um motel específico
    [HttpGet("{id}")]
    public IActionResult ObterMotel(int id)
    {
        var motel = _motelService.ObterMotel(id);
        if (motel == null)
            return NotFound(new { mensagem = "Motel não encontrado!" });

        return Ok(motel);
    }

    // � Atualizar um motel
    [HttpPut("{id}")]
    public IActionResult AtualizarMotel(int id, [FromBody] MotelDto motelDto)
    {
        var result = _motelService.AtualizarMotel(id, motelDto);
        if (!result.Sucesso)
            return BadRequest(result.Mensagem);

        return Ok(new { mensagem = "Motel atualizado com sucesso!" });
    }

    // � Excluir um motel
    [HttpDelete("{id}")]
    public IActionResult ExcluirMotel(int id)
    {
        var result = _motelService.ExcluirMotel(id);
        if (!result.Sucesso)
            return BadRequest(result.Mensagem);

        return Ok(new { mensagem = "Motel removido com sucesso!" });
    }
}
