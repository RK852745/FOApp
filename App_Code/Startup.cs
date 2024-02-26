using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FieldOfficer.Startup))]
namespace FieldOfficer
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
