using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Donation.Startup))]
namespace Donation
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
