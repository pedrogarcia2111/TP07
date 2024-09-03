using System.Data.SqlClient;
using Dapper;

namespace TP07.Models;

public class BD
    {
        private static string _connectionString = "Server=localhost;Database=JJOO;Trusted_Connection=True;";

        public static List<Categoria> ObtenerCategorias()
        {
            List<Categoria> categorias = new List<Categorias>();
            string SQL = "Select * From Categorias";
            using(SqlConnection db = new SqlConnection(_connectionString))
            
        }
        public static Dificultad ObtenerDificultades()
        {

        }
        public static ObtenerPreguntas(int dificultad, int categoria)
        {

        }
    }