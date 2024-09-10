namespace TP07.Models;


static public class Juego
{
static private string Username;
    static private int PuntajeActual;
    static private int CantidadPreguntasCorrectas;
    static private int ContadorNroPreguntaActual;
    static private Pregunta PreguntaActual;
    static private List<Pregunta> ListaPreguntas;
    static private List<Respuesta> ListaRespuestas;

    static private void InicializarJuego(string user)
{   
    Username="";
    PuntajeActual=0;
    CantidadPreguntasCorrectas=0;
    ContadorNroPreguntaActual=0;
    PreguntaActual=null;
    ListaPreguntas=null;
    ListaRespuestas=null;
}

    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    public static void CargarPartida(string username, int dificultad, int categoria)
        {
            InicializarJuego();

            Username = username; 

            ListaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);

            if (ListaPreguntas.Count > 0)
            {
                PreguntaActual = ListaPreguntas[0];
            }
        }
    public static Pregunta ObtenerProximaPregunta()
        {
            if (ContadorNroPreguntaActual < ListaPreguntas.Count)
            {
                PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
                return PreguntaActual;
            }
            else
            {
                return null; 
            }
        }
        public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
        {
            return BD.ObtenerRespuestas(idPregunta);
        }
        
        public static bool VerificarRespuesta(int idRespuesta)
{
    int puntosPorRespuestaCorrecta = 10; 
    bool respuestaCorrecta = false;

    
    foreach (Respuesta respuesta in ListaRespuestas)
    {
        if (respuesta.IdRespuesta == idRespuesta)
        {
            respuestaCorrecta = respuesta.Correcta; 
            break;
        }
    }

    
    if (respuestaCorrecta)
    {
        PuntajeActual += puntosPorRespuestaCorrecta;
        CantidadPreguntasCorrectas += 1;
    }

    
    ContadorNroPreguntaActual += 1;

    if (ContadorNroPreguntaActual < ListaPreguntas.Count)
    {
        PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
    }
    else
    {
        PreguntaActual = null; 
    }

    return respuestaCorrecta;
}
  
}

