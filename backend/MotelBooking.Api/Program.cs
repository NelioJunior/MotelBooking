using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Adicionar Autenticação JWT
var key = Encoding.ASCII.GetBytes("SUA_CHAVE_SECRETA_MUITO_FORTE_AQUI");
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});

// Adicionar Middleware personalizado
var app = builder.Build();
app.UseMiddleware<JwtMiddleware>();

// Habilitar Autenticação e Autorização
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.Run();
