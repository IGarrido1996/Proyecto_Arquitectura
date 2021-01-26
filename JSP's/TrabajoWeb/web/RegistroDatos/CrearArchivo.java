/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegistroDatos;

/**
 *
 * @author micha
 */
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

public class CrearArchivo {

    public static String generartxt(String log) {
        try {
            String ruta = "/Proyecto_Arquitectura/InformeUsuario.txt"; //ruta cambiara
            String contenido = "Contenido de ejemplo";
            File file = new File(ruta);
            // Si el archivo no existe es creado
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(log);
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


}
