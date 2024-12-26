using GestãoLoja.Components.Account;
using GestãoLoja.Components;
using GestãoLoja.Data;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Identity.UI.Services;
using GestãoLoja.Entities;

var builder = WebApplication.CreateBuilder(args);

// Configurar o HttpClient para ser usado em componentes Blazor
builder.Services.AddHttpClient();

// Serviços necessários para Blazor Web
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddAuthorizationCore(); // Autorizações simplificadas

// Configurar banco de dados (Exemplo: SQL Server)
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

// Configurar Identity com suporte a Roles (Admin, Gestor, Cliente)
builder.Services.AddIdentityCore<ApplicationUser>(options =>
{
    options.SignIn.RequireConfirmedAccount = true; // Confirmação de conta
})
    .AddRoles<IdentityRole>() // Adicionar suporte a roles (perfis de usuário)
    .AddEntityFrameworkStores<ApplicationDbContext>() // Identity com EF Core
    .AddSignInManager()
    .AddDefaultTokenProviders(); // Tokens de autenticação (ex: recuperação de senha)

// Autenticação e estado de autenticação no Blazor
builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = IdentityConstants.ApplicationScheme;
    options.DefaultSignInScheme = IdentityConstants.ExternalScheme;
})
    .AddIdentityCookies();

builder.Services.AddCascadingAuthenticationState(); // Estado de autenticação global
builder.Services.AddScoped<AuthenticationStateProvider, IdentityRevalidatingAuthenticationStateProvider>();
builder.Services.AddScoped<IdentityUserAccessor>();
builder.Services.AddScoped<IdentityRedirectManager>();

// Configuração de componentes Blazor interativos
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents(); // Configurar interatividade no servidor

// Serviço de email (substitua conforme necessário)
// builder.Services.AddSingleton<IEmailSender<ApplicationUser>, IdentityNoOpEmailSender>();
// builder.Services.AddSingleton<IEmailSender, IdentityNoOpEmailSender>();


// Configurar logging
builder.Logging.ClearProviders();
builder.Logging.AddConsole();

var app = builder.Build();

// Configuração do pipeline HTTP
if (app.Environment.IsDevelopment())
{
    app.UseMigrationsEndPoint(); // Facilita desenvolvimento com migrações
}
else
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true); // Página de erro no modo de produção
    app.UseHsts(); // Segurança adicional no modo de produção
}

app.UseHttpsRedirection(); // Redirecionar para HTTPS
app.UseStaticFiles(); // Servir arquivos estáticos (ex: CSS, JS)

// Configurar autenticação e autorização
app.UseAuthentication();
app.UseAuthorization();
app.UseAntiforgery(); // Proteção contra falsificação de solicitações

// Mapear componentes Razor e endpoints do Identity
app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode(); // Mapeia componentes interativos no servidor
app.MapAdditionalIdentityEndpoints(); // Mapeia endpoints adicionais do Identity

// Seed inicial para criar roles e admin padrão
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    await SeedRolesAndAdminAsync(services);
}

app.Run();

// Método para criar roles e o administrador inicial
static async Task SeedRolesAndAdminAsync(IServiceProvider serviceProvider)
{
    var roleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
    var userManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();

    // Roles padrão: Admin, Gestor e Cliente
    string[] roles = { "Admin", "Gestor", "Cliente" };

    foreach (var role in roles)
    {
        if (!await roleManager.RoleExistsAsync(role))
        {
            await roleManager.CreateAsync(new IdentityRole(role)); // Criar se não existir
        }
    }

    // Criar usuário administrador padrão
    var adminUsername = "Admin";
    var adminEmail = "Admin@loja.com";
    var adminPassword = "Admin123!";
    var adminNome = "Admin";
    var adminApelido = "Admin";
    var adminNIF = "999";
    var adminRua = "admin rua";
    var adminLocalidade1 = "admin loc";
    var adminLocalidade2 = "admin loc2";
    var adminPaís = "admin país";

    // Criar usuário gestor padrão
    var gestorUsername = "gestor";
    var gestorEmail = "gestor@loja.com";
    var gestorPassword = "Gestor123!";

    // Criar usuário cliente padrão
    var clienteUsername = "cliente";
    var clienteEmail = "cliente@loja.com";
    var clientePassword = "Cliente123!";
    var clienteNome = "Cliente";
    var clienteApelido = "Cliente";
    var clienteNIF = "123";
    var clienteRua = "cliente rua";
    var clienteLocalidade1 = "cliente loc";
    var clienteLocalidade2 = "cliente loc2";
    var clientePaís = "cliente país";


    if (await userManager.FindByEmailAsync(adminEmail) == null)
    {
        var adminUser = new ApplicationUser
        {
            UserName = adminUsername,
            Email = adminEmail,
            Nome = adminNome,
            Apelido = adminApelido,
            NIF = adminNIF,
            Rua = adminRua,
            Localidade1 = adminLocalidade1,
            Localidade2 = adminLocalidade2,
            Pais = adminPaís,
            LockoutEnabled = false,
            EmailConfirmed = true // Marcar como confirmado
        };

        var result = await userManager.CreateAsync(adminUser, adminPassword);
        if (result.Succeeded)
        {
            await userManager.AddToRoleAsync(adminUser, "Admin"); // Adicionar ao role "Admin"
        }
    }
    /*
    if (await userManager.FindByEmailAsync(gestorEmail) == null)
    {
        var funcUser = new ApplicationUser
        {
            UserName = gestorUsername,
            Email = gestorEmail,
            EmailConfirmed = true // Marcar como confirmado
        };

        var result = await userManager.CreateAsync(funcUser, gestorPassword);
        if (result.Succeeded)
        {
            await userManager.AddToRoleAsync(funcUser, "Gestor"); // Adicionar ao role "Gestor"
        }
    }
    */
    if (await userManager.FindByEmailAsync(clienteEmail) == null)
    {
        var clienteUser = new ApplicationUser
        {
            UserName = clienteUsername,
            Email = clienteEmail,
            Nome = clienteNome,
            Apelido = clienteApelido,
            NIF = clienteNIF,
            Rua = clienteRua,
            Localidade1 = clienteLocalidade1,
            Localidade2 = clienteLocalidade2,
            Pais = clientePaís,
            LockoutEnabled = false,
            EmailConfirmed = true // Marcar como confirmado
        };

        var result = await userManager.CreateAsync(clienteUser, clientePassword);
        if (result.Succeeded)
        {
            await userManager.AddToRoleAsync(clienteUser, "Cliente"); // Adicionar ao role "Cliente"
        }
    }
}

