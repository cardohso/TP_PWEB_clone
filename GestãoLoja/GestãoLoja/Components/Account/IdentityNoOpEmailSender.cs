using GestãoLoja.Data;
using GestãoLoja.Entities;
using Microsoft.AspNetCore.Identity.UI.Services;
using System.Threading.Tasks;

namespace GestãoLoja.Components.Account
{
    // Remove the "else if (EmailSender is IdentityNoOpEmailSender)" block from RegisterConfirmation.razor after updating with a real implementation.
    internal sealed class IdentityNoOpEmailSender : IEmailSender
    {
        private readonly IEmailSender emailSender = new NoOpEmailSender();

        public Task SendEmailAsync(string email, string subject, string htmlMessage) =>
            emailSender.SendEmailAsync(email, subject, htmlMessage);

        public Task SendConfirmationLinkAsync(ApplicationUser user, string email, string confirmationLink) =>
            SendEmailAsync(email, "Confirm your email", $"Please confirm your account by <a href='{confirmationLink}'>clicking here</a>.");

        public Task SendPasswordResetLinkAsync(ApplicationUser user, string email, string resetLink) =>
            SendEmailAsync(email, "Reset your password", $"Please reset your password by <a href='{resetLink}'>clicking here</a>.");

        public Task SendPasswordResetCodeAsync(ApplicationUser user, string email, string resetCode) =>
            SendEmailAsync(email, "Reset your password", $"Please reset your password using the following code: {resetCode}");
    }

    internal sealed class NoOpEmailSender : IEmailSender
    {
        public Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            // No-op email sender implementation
            return Task.CompletedTask;
        }
    }
}