/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDeDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author micha
 */
public class conectarBasedeDatos {

    public static void connect() {
        String url = "jdbc:mysql://localhost:mipagina";
        String user = "root";
        String pass = "";
System.out.println("Conectando…");
try (Connection connection = DriverManager.getConnection(url, user, pass)) {
            System.out.println("Conectado!!");

}catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}
