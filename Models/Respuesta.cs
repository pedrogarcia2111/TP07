    public class Respuesta
    {
        public int IdRespuesta {get; set;}
        public int IdPregunta {get; set;}
        public int Opcion {get; set;}
        public string Contenido {get; set;}
        public bool Correcta {get; set;}
        public string Foto{get; set;}


        public Respuesta(int idrespuesta, int idpregunta, int opcion, string contenido, bool correcta, string foto){
            IdRespuesta= idrespuesta;
            IdPregunta= idpregunta;
            Opcion = opcion;
            Contenido = Contenido;
            Correcta=correcta;
            Foto=foto;
            
        }
        public Respuesta()
        {

        }

    }