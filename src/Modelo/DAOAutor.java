/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;
import java.util.*; 

/**
 *
 * @author Gy Billie
 */
public class DAOAutor {
    
    //Metodo para Insertar consultas a la Base de datos...
    public Autor Insertar(String cedula,String nombres, String apellidos, String email, java.sql.Date fechaNac){
        //Consulta para insertar valores a la base de datos.
        String transacciones = "INSERT INTO Autor VALUES('"
                + nombres + "', '"
                + apellidos + "', '"
                + email + "', '"
                + cedula + "', '"
                + fechaNac + "')";
        
        //Si la condicion cumple retorna Autor con sus parametros..
        if(new DataBase().Actualizar(transacciones) > 0){
            return new Autor(cedula, nombres, apellidos, email, fechaNac);
        }
        //Retorno nulo.
        return null;
    }
    
    //Metodo para Actualizar infromacion en la Base de datos.
    public int Actualizar(int id, String nombres, String apellidos, String email,String cedula, java.sql.Date fechaNac){
        //COnsulta para Actualizar valores en la base de datos.
        String transaccion = "UPDATE Autor SET nombres='"
                + nombres + "', apellidos='"
                + apellidos + "', email='"
                + email + "', fechaNac='"
                + fechaNac+ "', cedula='"
                + cedula  + "' WHERE id_autor="
                + id;
        //Retorna los valores almacenados en el String trasanccion.
        return new DataBase(). Actualizar(transaccion);
    }
    
    //Metodo para Obtner la informacion de la base de datos.
    public List ObtenerDatos(){
        String transaccion = "SELECT * FROM Autor";
        
        //Declracion de array pasando con la clase DataBase.
        List<Map> registros = new DataBase(). Listar(transaccion);
        List<Autor> autores = new ArrayList();
        
        //For mejorado, recorre el objeto registros y lo pasa al Map registro.
        for(Map registro : registros){
            Autor aut =  new Autor((int)registro.get("id_autor"),
            (String)registro.get("nombres"),
            (String)registro.get("apellidos"),
            (String)registro.get("email"),
            (String)registro.get("cedula"),
            (java.sql.Date) registro.get("fechaNac"));
            //Se agrega nombre del objeto Autor aut al Array autores con .add
            autores.add(aut);
        }
        //Retorna autores.
        return autores;
    }
    
    //Metodo para Eliminar un Autor. Pasando como parametro un valor de tipo int.
    public int Eliminar(int id){
        //Consulta para eliminar un Autor de la base de datos.
        String transaccion = "DELETE FROM Autor WHERE id_autor='" + id + "'";
        
        //Retorna los datos actuales de la base de datos.
        return new DataBase().Actualizar(transaccion);
    }
}
