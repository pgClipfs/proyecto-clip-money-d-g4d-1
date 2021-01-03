using System.Net;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;
using BackendBilletera.Models;
//using WebApplication3.Models;

namespace BackendBilletera.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null) 
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            GestorLogin gLogin = new GestorLogin();

            //bool isCredentialValid = (login.Password == "123456");

            bool isCredentialValid = gLogin.ValidarLogin(login);
            if (isCredentialValid)
            {
                var token = TokenGenerator.GenerateTokenJwt(login.Username);
                GestorSaldo us = new GestorSaldo();
                us.guardar(login.Username);
                return Ok(new User(login.Username, token));
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}
