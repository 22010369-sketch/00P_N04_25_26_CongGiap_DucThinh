package com.example.servingwebcontent.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class AivenConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://avnadmin:AVNS_0MtwKlj1ktmp2WxjwWf@oopprojectconggiap-nguyenconggiap1610-ddcd.h.aivencloud.com:24304/defaultdb?ssl-mode=REQUIRED";
            String user = "avnadmin";
            String password = "AVNS_0MtwKlj1ktmp2WxjwWf";
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}