package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnection {
	public static String url = "jdbc:mysql://localhost:3306/issuetracker?useTimezone=true&serverTimezone=America/Sao_Paulo";
	//public static String url = "jdbc:mysql://localhost:3306/issuetracker";
	public static String usuario = "root";
	public static String senha = "";// mudar para ""
	
	public static Connection abrirConexao() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(url, usuario, senha);
	}
}
