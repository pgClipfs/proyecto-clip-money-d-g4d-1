using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using BackenBilletera.Models;

namespace BackenBilletera.Controllers.Api
{
  
    public class SaldosController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

        // GET: api/Saldos
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<Saldo> GetSaldo()
        {
            return db.Saldo;
        }

        // GET: api/Saldos/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Saldo))]
        public IHttpActionResult GetSaldo(int id)
        {
            Saldo saldo = db.Saldo.Find(id);
            if (saldo == null)
            {
                return NotFound();
            }

            return Ok(saldo);
        }

        // PUT: api/Saldos/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSaldo(int id, SaldoMonto saldo)
        {

            //var usuarios = db.Usuario.Find(id);
            
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            


            // Buscar usuario por id
            var current = db.Saldo.Find(id);

            try
            {
                current.monto = saldo.monto;
                
                                


                db.Saldo.Attach(current);
                db.Entry(current).State = EntityState.Modified;
                db.SaveChanges();
                return StatusCode(HttpStatusCode.OK);
            }
            catch (DbUpdateConcurrencyException)
            {
                
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Saldos
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Saldo))]
        public IHttpActionResult PostSaldo(int id, Saldo saldo)
        {

            //var usuarios = db.Usuario.Find(id);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var oSaldo = new Saldo();
            oSaldo.idUsuario = id;
            oSaldo.idMoneda = 1;
            oSaldo.monto = saldo.monto;


            db.Saldo.Add(oSaldo);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = saldo.idSaldo }, saldo);
        }

        // DELETE: api/Saldos/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Saldo))]
        public IHttpActionResult DeleteSaldo(int id)
        {
            Saldo saldo = db.Saldo.Find(id);
            if (saldo == null)
            {
                return NotFound();
            }

            db.Saldo.Remove(saldo);
            db.SaveChanges();

            return Ok(saldo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SaldoExists(int id)
        {
            return db.Saldo.Count(e => e.idSaldo == id) > 0;
        }
    }
}