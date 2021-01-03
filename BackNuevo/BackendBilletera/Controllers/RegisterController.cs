using BackendBilletera.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;

namespace BackendBilletera.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/register")]
    public class RegisterController : ApiController
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

            gLogin.ValidarRegistro(login);
            /*            
             *            bool isCredentialValid = gLogin.ValidarLogin(login);
                        if (isCredentialValid)
                        {
                            var token = TokenGenerator.GenerateTokenJwt(login.Username);
                            return Ok(new User(login.Username, token));
                        }
                        else
                        {
                            return Unauthorized();
                        }*/
            return Ok(true);
        }
    }
}
