package dao.implement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.MysqlConnection;
import dao.interfaces.UsuarioDaoInterface;
import model.Usuario;

public class UsuarioDaoImplement implements UsuarioDaoInterface {

	@Override
	public int createUser(Usuario usuario) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "insert into usuarios(nome,sobrenome,email,senha,nivel,status) values (?,?,?,?,?,?)";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, usuario.getNome());
			preparedStatement.setString(2, usuario.getSobrenome());
			preparedStatement.setString(3, usuario.getEmail());
			preparedStatement.setString(4, usuario.getSenha());
			preparedStatement.setString(5, usuario.getNivel());
			preparedStatement.setInt(6, usuario.getStatus());
			int resposta = preparedStatement.executeUpdate();

			if (resposta == 1) {
				//System.out.println("Registro inserido");
				ResultSet res = preparedStatement.getGeneratedKeys();
				if (res.first()) {
					//System.out.println("Codigo ID gerado: " + res.getInt(1));
				}
				res.close();
				preparedStatement.close();
				return resposta;
			} else {
				return 0;
			}

		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public Usuario retrieveUser(String email, String senha) {

		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from usuarios where email=? and senha=? limit 1";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, senha);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			Usuario usuario = null;
			while (resultSet.next()) {
				usuario = new Usuario();
				usuario.setId(resultSet.getInt("id"));
				usuario.setNome(resultSet.getString("nome"));
				usuario.setSobrenome(resultSet.getString("sobrenome"));
				usuario.setEmail(resultSet.getString("email"));
				usuario.setSenha(resultSet.getString("senha"));
				usuario.setNivel(resultSet.getString("nivel"));
				usuario.setStatus(resultSet.getInt("status"));
			}
			if (usuario==null) {
				 sql = "select * from usuarios where email=? limit 1";
				 preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, email);
				 resultSet = preparedStatement.executeQuery();
				
				 usuario = null;
				while (resultSet.next()) {
					usuario = new Usuario();
					usuario.setId(0);
					usuario.setEmail(resultSet.getString("email"));
				}	
				
				
			}

			preparedStatement.close();
			return usuario;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public int changePassword(String senha, int id) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "update usuarios set senha =?,status=? where id=?";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, senha);
			preparedStatement.setInt(2, 1);
			preparedStatement.setInt(3, id);
			int resposta = preparedStatement.executeUpdate();
			preparedStatement.close();
			return resposta;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

}
