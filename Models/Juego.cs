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
    Username=user;
    PuntajeActual=0;
    CantidadPreguntasCorrectas=0;
    ContadorNroPreguntaActual=0;
    PreguntaActual=null;
    ListaPreguntas=null;
    ListaRespuestas=null;
}

}
    


