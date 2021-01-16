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
    public class DestinosController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

        // GET: api/Destinos
        public IQueryable<Destinos> GetDestinos()
        {
            return db.Destinos;
        }

        // GET: api/Destinos/5
        [ResponseType(typeof(Destinos))]
        public IHttpActionResult GetDestinos(int id)
        {
            Destinos destinos = db.Destinos.Find(id);
            if (destinos == null)
            {
                return NotFound();
            }

            return Ok(destinos);
        }

        // PUT: api/Destinos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDestinos(int id, Destinos destinos)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != destinos.idUserDestino)
            {
                return BadRequest();
            }

            db.Entry(destinos).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DestinosExists(id))
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

        // POST: api/Destinos
        [ResponseType(typeof(Destinos))]
        public IHttpActionResult PostDestinos(Destinos destinos)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Destinos.Add(destinos);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (DestinosExists(destinos.idUserDestino))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = destinos.idUserDestino }, destinos);
        }

        // DELETE: api/Destinos/5
        [ResponseType(typeof(Destinos))]
        public IHttpActionResult DeleteDestinos(int id)
        {
            Destinos destinos = db.Destinos.Find(id);
            if (destinos == null)
            {
                return NotFound();
            }

            db.Destinos.Remove(destinos);
            db.SaveChanges();

            return Ok(destinos);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DestinosExists(int id)
        {
            return db.Destinos.Count(e => e.idUserDestino == id) > 0;
        }
    }
}