using System.Collections.Generic;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;
using BackendBilletera.Models;

namespace BackendBilletera.Controllers
{
    [Authorize]
    public class DefaultController : ApiController
    {
        // GET: api/Default
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        //public IEnumerable<Cliente> Get()
        //{
        //    List<Cliente> lista = new List<Cliente>();
        //    lista.Add(new Cliente() { nombre = "pablo", apellido = "marmol" });
        //    lista.Add(new Cliente() { nombre = "pedro", apellido = "picapiedras" });
        //    return lista;
        //}

        public IEnumerable<Saldo> Get()
        {
            //var identity = Thread.CurrentPrincipal.Identity;
            GestorSaldo saldo = new GestorSaldo();
            //return saldo.ValidarSaldo(3);

            List<Saldo> lista = new List<Saldo>();
            int id = saldo.ObtenerId(saldo.dar());
            int result = saldo.ValidarSaldo(id);
            lista.Add(new Saldo() { monto = result });
            return lista;
        }

        // GET: api/Default/5
        public int Get(int id)
        {

            return 100;
        }


        // POST: api/Default
        //[HttpPost]
        public IEnumerable<Saldo> Post([FromBody] string value)
        {
            GestorSaldo saldo = new GestorSaldo();
            List<Saldo> lista = new List<Saldo>();
            int id = saldo.ObtenerId(value);
            int result = saldo.ValidarSaldo(id);
            lista.Add(new Saldo() { monto = result });
            return lista;
        }

        // PUT: api/Default/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Default/5
        public void Delete(int id)
        {
        }
    }
}
