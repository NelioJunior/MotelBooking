using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Authorize] // � Requer autenticação JWT
[Route("api/clientes")]
[ApiController]
public class ClienteController : ControllerBase
{
    private readonly IClienteService _clienteService;

    public ClienteController(IClienteService clienteService)
    {
        _clienteService = clienteService;
    }

    // � Criar novo cliente
    [HttpPost]
    public IActionResult CriarCliente([FromBody] ClienteDto cliente)
    {
        var result = _clienteService.CriarCliente(cliente);
        if (!result.Sucesso)
            return BadRequest(result.Mensagem);

        return Ok(new { mensagem = "Cliente cadastrado com sucesso!" });
    }

    // � Listar clientes
    [HttpGet]
    public IActionResult ListarClientes()
    {
        var clientes = _clienteService.ListarClientes();
        return Ok(clientes);
    }
}
