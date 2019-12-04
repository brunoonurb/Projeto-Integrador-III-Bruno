package dao.implement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.MysqlConnection;
import dao.interfaces.LogDaoInterface;
import model.LogAcao;
import model.LogAcesso;

public class LogDaoImplement implements LogDaoInterface {

	@Override
	public int createAcessLog(LogAcesso logAcesso) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "insert into logacessos(data,hora,nomeUsuario,sobrenomeUsuario,nivelUsuario,idUsuario) values (?,?,?,?,?,?)";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, logAcesso.getData());
			preparedStatement.setString(2, logAcesso.getHora());
			preparedStatement.setString(3, logAcesso.getNomeUsuario());
			preparedStatement.setString(4, logAcesso.getSobrenomeUsuario());
			preparedStatement.setString(5, logAcesso.getNivelUsuario());
			preparedStatement.setInt(6, logAcesso.getIdUsuario());
			int resposta = preparedStatement.executeUpdate();
			if (resposta == 1) {
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
	public List<LogAcesso> retrieveAcessLogs() {
		
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from logAcessos";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<LogAcesso> logAcessos = new ArrayList<LogAcesso>();
			while (resultSet.next()) {
				LogAcesso logAcesso = new LogAcesso();

				logAcesso.setId(resultSet.getInt("id"));
				logAcesso.setData(resultSet.getString("data"));
				logAcesso.setHora(resultSet.getString("hora"));
				logAcesso.setNomeUsuario(resultSet.getString("nomeUsuario"));
				logAcesso.setSobrenomeUsuario(resultSet.getString("sobrenomeUsuario"));
				logAcesso.setNivelUsuario(resultSet.getString("nivelUsuario"));
				logAcesso.setIdUsuario(resultSet.getInt("idUsuario"));
				logAcessos.add(logAcesso);

			}
			resultSet.close();
			preparedStatement.close();
			return logAcessos;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}

	}

	@Override
	public List<LogAcao> retrieveActionLogs() {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from logAcoes";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<LogAcao> logAcoes = new ArrayList<LogAcao>();
			while (resultSet.next()) {
				LogAcao logAcao = new LogAcao();

				logAcao.setId(resultSet.getInt("id"));
				logAcao.setData(resultSet.getString("data"));
				logAcao.setHora(resultSet.getString("hora"));
				logAcao.setAcao(resultSet.getString("acao"));
				logAcao.setNomeUsuario(resultSet.getString("nomeUsuario"));
				logAcao.setSobrenomeUsuario(resultSet.getString("sobrenomeUsuario"));
				logAcao.setNivelUsuario(resultSet.getString("nivelUsuario"));
				logAcao.setIdUsuario(resultSet.getInt("idUsuario"));
				logAcoes.add(logAcao);

			}
			resultSet.close();
			preparedStatement.close();
			return logAcoes;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public int createActionLog(LogAcao logAcao) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "insert into logacoes(data,hora,acao,nomeUsuario,sobrenomeUsuario,nivelUsuario,idUsuario) values (?,?,?,?,?,?,?)";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, logAcao.getData());
			preparedStatement.setString(2, logAcao.getHora());
			preparedStatement.setString(3, logAcao.getAcao());
			preparedStatement.setString(4, logAcao.getNomeUsuario());
			preparedStatement.setString(5, logAcao.getSobrenomeUsuario());
			preparedStatement.setString(6, logAcao.getNivelUsuario());
			preparedStatement.setInt(7, logAcao.getIdUsuario());
			int resposta = preparedStatement.executeUpdate();
			if (resposta == 1) {
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

}
