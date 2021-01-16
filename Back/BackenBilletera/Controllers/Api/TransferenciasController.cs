using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using BackenBilletera.Models;

namespace BackenBilletera.Controllers.Api
{
    public class TransferenciasController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

        // GET: api/Transferencias
        public IQueryable<Transferencia> GetTransferencia()
        {
            return db.Transferencia;
        }

        // GET: api/Transferencias/5
        [ResponseType(typeof(Transferencia))]
        public IHttpActionResult GetTransferencia(int id)
        {
            Transferencia transferencia = db.Transferencia.Find(id);
            if (transferencia == null)
            {
                return NotFound();
            }

            return Ok(transferencia);
        }

        // PUT: api/Transferencias/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTransferencia(int id, Transferencia transferencia)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != transferencia.idTransferencia)
            {
                return BadRequest();
            }

            db.Entry(transferencia).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TransferenciaExists(id))
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

        // POST: api/Transferencias
        [ResponseType(typeof(Transferencia))]
        public IHttpActionResult PostTransferencia(Transferencia transferencia)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Transferencia.Add(transferencia);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = transferencia.idTransferencia }, transferencia);
        }

        // DELETE: api/Transferencias/5
        [ResponseType(typeof(Transferencia))]
        public IHttpActionResult DeleteTransferencia(int id)
        {
            Transferencia transferencia = db.Transferencia.Find(id);
            if (transferencia == null)
            {
                return NotFound();
            }

            db.Transferencia.Remove(transferencia);
            db.SaveChanges();

            return Ok(transferencia);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TransferenciaExists(int id)
        {
            return db.Transferencia.Count(e => e.idTransferencia == id) > 0;
        }
    }
}