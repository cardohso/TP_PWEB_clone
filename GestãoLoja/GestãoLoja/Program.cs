using GestãoLoja.Components.Account;
using GestãoLoja.Components;
using GestãoLoja.Data;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

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
builder.Services.AddSingleton<IEmailSender<ApplicationUser>, IdentityNoOpEmailSender>();

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
    var adminEmail = "admin@loja.com";
    var adminPassword = "Admin123!";

    if (await userManager.FindByEmailAsync(adminEmail) == null)
    {
        var adminUser = new ApplicationUser
        {
            UserName = adminEmail,
            Email = adminEmail,
            EmailConfirmed = true // Marcar como confirmado
        };

        var result = await userManager.CreateAsync(adminUser, adminPassword);
        if (result.Succeeded)
        {
            await userManager.AddToRoleAsync(adminUser, "Admin"); // Adicionar ao role "Admin"
        }
    }
}
