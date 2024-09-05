using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07.Models;

namespace TP07.Controllers;

public class JuegoController : Controller
    {
       
        public IActionResult Index()
        {
            return View();
        }

     
        public IActionResult ConfigurarJuego()
        {
            ViewBag.Categorias = Juego.ObtenerCategorias();
            ViewBag.Dificultades = Juego.ObtenerDificultades();
            return View();
        }

       
        public IActionResult Comenzar(string username, int dificultad, int categoria)
        {
            Juego.CargarPartida(username, dificultad, categoria);
            return RedirectToAction("Jugar");
        }

        
        public IActionResult Jugar()
        {
            Pregunta preguntaActual = Juego.ObtenerProximaPregunta();
            if (preguntaActual == null)
            {
                return View("Fin");
            }

            ViewBag.Pregunta = preguntaActual;
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(preguntaActual.IdPregunta);
            return View();
        }

       
        [HttpPost]
        public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
        {
            bool esCorrecta = Juego.VerificarRespuesta(idRespuesta);
            ViewBag.EsCorrecta = Juego.;
        
            

            return View("Respuesta");
        }
    }






