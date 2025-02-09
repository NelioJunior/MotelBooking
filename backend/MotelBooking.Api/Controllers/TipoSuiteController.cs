using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

[Authorize]
[Route("api/tiposuite")]
[ApiController]
public class TipoSuiteController : ControllerBase
{
    private readonly ITipoSuiteService _tipoSuiteService;

    public TipoSuiteController(ITipoSuiteService tipoSuiteService)
    {
        _tipoSuiteService = tipoSuiteService;
    }

    // � Listar tipos de suítes disponíveis
    [HttpGet]
    public IActionResult ListarTipos()
    {
        var tipos = _tipoSuiteService.ListarTipos();
        return Ok(tipos);
    }
}
