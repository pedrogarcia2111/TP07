using System.Data.SqlClient;
using Dapper;

namespace TP07.Models;

public class BD
    {
        private static string _connectionString = "Server=localhost;Database=PreguntadOrt;Trusted_Connection=True;";

        private static List<Categoria> _ListadoCategorias;

        public static List<Categoria> ObtenerCategorias()
        {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
        string sql = "SELECT * FROM Categorias";
        _ListadoCategorias = db.Query<Categoria>(sql).ToList();
        }
        return _ListadoCategorias;
        }

        private static List<Dificultad> _ListadoDificultades;

        public static List<Dificultad> ObtenerDificultades()
        {
            using(SqlConnection db = new SqlConnection(_connectionString))
        {
        string sql = "SELECT * FROM Dificultades";
        _ListadoDificultades = db.Query<Dificultad>(sql).ToList();

        }
        return _ListadoDificultades;
        }

        
        public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
        {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Preguntas";

            if (dificultad != -1 && categoria != -1)
            {
                sql = "SELECT * FROM Preguntas WHERE IdDificultad = @dificultad AND IdCategoria = @categoria";
                return db.Query<Pregunta>(sql, new { dificultad, categoria }).ToList();
            }
            else if (dificultad != -1)
            {
                sql = "SELECT * FROM Preguntas WHERE IdDificultad = @dificultad";
                return db.Query<Pregunta>(sql, new { dificultad }).ToList();
            }
            else if (categoria != -1)
            {
                sql = "SELECT * FROM Preguntas WHERE IdCategoria = @categoria";
                return db.Query<Pregunta>(sql, new { categoria }).ToList();
            }

        return db.Query<Pregunta>(sql).ToList();
        }
        }

        private static List<Respuesta> _ListadoRespuestas;

        public static List<Respuesta> ObtenerRespuestas(int idPregunta)
        {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
        string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @idPregunta";
        _ListadoRespuestas = db.Query<Respuesta>(sql, new { idPregunta }).ToList();
        }
        return _ListadoRespuestas;
        }

        
        
    }