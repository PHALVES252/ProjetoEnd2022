/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author sala305b
 */
public class BancodeDados {
    
     public static Connection getConexao() {
        try {
            //String strcon ="jdbc:mysql://localhost:3306/banco";
            String strcon = "jdbc:mysql://localhost:3306/bdecoleta"
                    + "?useTimezone=true&serverTimezone=America/Sao_Paulo"
                    + "&autoReconnect=true&useSSL=false";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.
                    getConnection(strcon, "root", "123456");

            return conn;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
