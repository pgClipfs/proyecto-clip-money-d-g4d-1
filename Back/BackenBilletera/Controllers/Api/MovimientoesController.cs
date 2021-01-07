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
    public class MovimientoesController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

        // GET: api/Movimientoes/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<Movimiento> GetMovimiento( int id)
        {
            var lstMoviminetos = db.Movimiento.Where(x => x.idUsuario == id);
            return lstMoviminetos;
        }

        // GET: api/Movimientoes/5
        /*[EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Movimiento))]
        public IHttpActionResult GetMovimiento(int id)
        {
            Movimiento movimiento = db.Movimiento.Find(id);
            if (movimiento == null)
            {
                return NotFound();
            }

            return Ok(movimiento);
        }*/

        // PUT: api/Movimientoes/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMovimiento(int id, Movimiento movimiento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != movimiento.idMovimiento)
            {
                return BadRequest();
            }

            db.Entry(movimiento).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MovimientoExists(id))
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

        // POST: api/Movimientoes
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Movimiento))]
        public IHttpActionResult PostMovimiento(int id, Movimiento movimiento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var oMovimiento = new Movimiento();
            oMovimiento.idTipoMov = 1;
            oMovimiento.idUsuario = id;
            oMovimiento.monto = movimiento.monto;
            oMovimiento.fecha = DateTime.Now;
            oMovimiento.numComprobante = 112541;

            db.Movimiento.Add(oMovimiento);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = movimiento.idMovimiento }, movimiento);
        }

        // DELETE: api/Movimientoes/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Movimiento))]
        public IHttpActionResult DeleteMovimiento(int id)
        {
            Movimiento movimiento = db.Movimiento.Find(id);
            if (movimiento == null)
            {
                return NotFound();
            }

            db.Movimiento.Remove(movimiento);
            db.SaveChanges();

            return Ok(movimiento);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MovimientoExists(int id)
        {
            return db.Movimiento.Count(e => e.idMovimiento == id) > 0;
        }
    }
}