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
        public IHttpActionResult PutSaldo(int id, Saldo saldo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != saldo.idSaldo)
            {
                return BadRequest();
            }

            db.Entry(saldo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SaldoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Saldos
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Saldo))]
        public IHttpActionResult PostSaldo(Saldo saldo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Saldo.Add(saldo);
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