package JDBC;
import java.sql.*;

public class StudentJDBC {
    public static void main(String[] args) {

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/college",
                "root",
                "@Ayush2055"
            );

            System.out.println("Connected Successfully!");

            // Create statement
            Statement stmt = con.createStatement();

            // Execute query
            ResultSet rs = stmt.executeQuery("SELECT * FROM Student");

            System.out.println("RollNo\tName\tClass");

            while (rs.next()) {
                System.out.println(
                    rs.getInt("rollno") + "\t" +
                    rs.getString("name") + "\t" +
                    rs.getString("class")
                );
            }

            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}