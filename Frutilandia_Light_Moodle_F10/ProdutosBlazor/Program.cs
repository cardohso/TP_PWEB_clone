using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

using ProdutosBlazor.Components;

using RCLProdutos.Services.Interfaces;
using RCLProdutos.Services;
using RCLAPI.Services;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

builder.Services.AddServerSideBlazor();
builder.Services.AddRazorPages();

builder.Services.AddHttpClient();




builder.Services.AddScoped<ISliderUtilsServices, SliderUtilsServices>();
builder.Services.AddScoped<ICardsUtilsServices, CardsUtilsServices>();

builder.Services.AddScoped<IApiServices, ApiService>();

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = 
    new Uri("https://hhzdfscd-7180.uks1.devtunnels.ms/") });

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
