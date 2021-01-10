package practicaFinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class baseDatos {
    private static Connection con;
    // Declaramos los datos de conexion a la bd
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String user="root";
    private static final String pass="contraseña";
    private static final String url="jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    // Funcion que va conectarse a mi bd de mysql
    public void conector() throws ClassNotFoundException {
        // Reseteamos a null la conexion a la bd
        con=null;
        try{
            Class.forName(driver);
            // Nos conectamos a la bd
            con= (Connection) DriverManager.getConnection(url, user, pass);
            // Si la conexion fue exitosa mostramos un mensaje de conexion exitosa
            if (con!=null){
                System.out.println("Conexion establecida");
            }
        }// Si la conexion NO fue exitosa mostramos un mensaje de error
        catch (ClassNotFoundException | SQLException e){
            System.out.println("Error de conexion" + e);
        }
    }
    
    public void consulta(){
        try{
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/arquitecturaweb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "contraseña");
            Statement st = conexion.createStatement();
            st.executeUpdate("INSERT INTO empresa (name, empresaID) VALUES ('Vodafone','00002')");
        }catch(SQLException e){
            System.out.println("Error" + e);
        }
    }
}
