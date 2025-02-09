using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Route("api/usuarios")]
[ApiController]
public class UsuarioController : ControllerBase
{
    private readonly IUserService _userService;

    public UsuarioController(IUserService userService)
    {
        _userService = userService;
    }

    // � Registro de Usuário
    [HttpPost("register")]
    public IActionResult Register([FromBody] UsuarioDto model)
    {
        var result = _userService.Register(model);
        if (!result.Sucesso)
            return BadRequest(result.Mensagem);

        return Ok(new { mensagem = "Usuário registrado com sucesso!" });
    }

    // � Login e Geração de Token JWT
    [HttpPost("login")]
    public IActionResult Login([FromBody] LoginDto model)
    {
        var token = _userService.Login(model);
        if (token == null)
            return Unauthorized("Usuário ou senha inválidos.");

        return Ok(new { token });
    }
}
