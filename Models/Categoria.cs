public class Categoria
{
    public int IdCategoria {get; set;}
    public string Nombre {get; set;}
    public string Foto {get; set;}

    public Categoria(int idcategoria, string nombre, string foto){
        IdCategoria=idcategoria;
        Nombre=nombre;
        Foto=foto;
        
    }
    public Categoria()
    {

    }

}