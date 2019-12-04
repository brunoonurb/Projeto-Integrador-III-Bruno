package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.MysqlConnection;
import dao.interfaces.CoordenadorDaoInterface;
import model.EdicaoTicket;
import model.LogAcesso;
import model.Resposta;
import model.Ticket;
import model.Usuario;

public class CoordenadorDaoImplement implements CoordenadorDaoInterface {

	@Override
	public int cadastraCoordenador(Usuario usuario) {
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
				// System.out.println("Registro inserido");
				ResultSet res = preparedStatement.getGeneratedKeys();
				if (res.first()) {
					// System.out.println("Codigo ID gerado: " + res.getInt(1));
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
	public List<Usuario> buscaSupervisores() {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from usuarios where nivel='Supervisor'";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Usuario> supervisores = new ArrayList<Usuario>();
			while (resultSet.next()) {
				Usuario supervisor = new Usuario();

				supervisor.setId(resultSet.getInt("id"));
				supervisor.setNome(resultSet.getString("nome"));
				supervisor.setSobrenome(resultSet.getString("sobrenome"));
				supervisor.setEmail(resultSet.getString("email"));
				supervisor.setSenha(resultSet.getString("senha"));
				supervisor.setNivel(resultSet.getString("nivel"));
				supervisor.setStatus(resultSet.getInt("status"));

				supervisores.add(supervisor);
			}
			resultSet.close();
			preparedStatement.close();
			return supervisores;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public boolean excluiSupervisor(String id) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "delete from usuarios where id='" + id + "'";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			boolean resposta = preparedStatement.execute();

			return resposta;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return false;
		}
	}

	@Override
	public Usuario buscaSupervisor(String id) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			java.sql.PreparedStatement preparedStatement = connection
					.prepareStatement("select * from usuarios where id='" + id + "'");
			ResultSet resultSet = preparedStatement.executeQuery();
			Usuario usuario = new Usuario();
			while (resultSet.next()) {
				usuario.setId(resultSet.getInt("id"));
				usuario.setNome(resultSet.getString("nome"));
				usuario.setSobrenome(resultSet.getString("sobrenome"));
				usuario.setEmail(resultSet.getString("email"));
				usuario.setSenha(resultSet.getString("senha"));
				usuario.setNivel(resultSet.getString("nivel"));
				usuario.setStatus(resultSet.getInt("status"));
			}

			resultSet.close();
			preparedStatement.close();
			return usuario;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public int atualizaSupervisor(Usuario usuario) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {

			String sql = "update usuarios set nome=?,sobrenome=?,email=?,senha=?,nivel=?,status=? where id = '"
					+ usuario.getId() + "'";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, usuario.getNome());
			preparedStatement.setString(2, usuario.getSobrenome());
			preparedStatement.setString(3, usuario.getEmail());
			preparedStatement.setString(4, usuario.getSenha());
			preparedStatement.setString(5, usuario.getNivel());
			preparedStatement.setInt(6, usuario.getStatus());
			int resposta = preparedStatement.executeUpdate();

			preparedStatement.close();
			return resposta;

		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public List<Ticket> buscaTickets() {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select tickets.*,statusTickets.descricao as explicacao from tickets inner join statusTickets where tickets.status=statusTickets.id having explicacao in('pendente c.','atribuido')";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Ticket> tickets = new ArrayList<Ticket>();
			while (resultSet.next()) {
				Ticket ticket = new Ticket();

				ticket.setId(resultSet.getInt("id"));
				ticket.setIdCliente(resultSet.getInt("idCliente"));
				ticket.setNomeCliente(resultSet.getString("nomeCliente"));
				ticket.setAssunto(resultSet.getString("assunto"));
				ticket.setDescricao(resultSet.getString("descricao"));
				ticket.setStatus(resultSet.getInt("status"));
				ticket.setLinkPrint(resultSet.getString("linkPrint"));
				ticket.setData(resultSet.getString("data"));
				ticket.setHora(resultSet.getString("hora"));
				ticket.setTempoCriacao(resultSet.getString("tempoCriacao"));
				ticket.setExplicacao(resultSet.getString("explicacao"));
				ticket.setAtribuicaoTecnico(resultSet.getInt("atribuicaoTecnico"));

				tickets.add(ticket);

			}
			resultSet.close();
			preparedStatement.close();
			return tickets;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public List<Usuario> buscaTecnicos() {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from usuarios where nivel='tecnico'";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Usuario> tecnicos = new ArrayList<Usuario>();
			while (resultSet.next()) {
				Usuario tecnico = new Usuario();

				tecnico.setId(resultSet.getInt("id"));
				tecnico.setNome(resultSet.getString("nome"));
				tecnico.setSobrenome(resultSet.getString("sobrenome"));
				tecnico.setEmail(resultSet.getString("email"));
				tecnico.setSenha(resultSet.getString("senha"));
				tecnico.setNivel(resultSet.getString("nivel"));
				tecnico.setStatus(resultSet.getInt("status"));

				tecnicos.add(tecnico);
			}
			resultSet.close();
			preparedStatement.close();
			return tecnicos;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public int atribuiTecnico(String idTecnico, String idTicket) {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "update tickets set atribuicaoTecnico=? where id=?";

			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, Integer.parseInt(idTecnico));
			preparedStatement.setInt(2, Integer.parseInt(idTicket));

			int resposta = preparedStatement.executeUpdate();

			preparedStatement.close();
			return resposta;

		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public List<Resposta> buscaRespostas() {
		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from respostasTickets";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Resposta> respostas = new ArrayList<Resposta>();

			while (resultSet.next()) {
				Resposta resposta = new Resposta();
				resposta.setId(resultSet.getInt("id"));
				resposta.setIdTicket(resultSet.getInt("idTicket"));
				resposta.setIdUsuario(resultSet.getInt("idUsuario"));
				resposta.setNomeUsuario(resultSet.getString("nomeUsuario"));
				resposta.setNivelUsuario(resultSet.getString("nivelUsuario"));
				resposta.setResposta(resultSet.getString("resposta"));
				resposta.setData(resultSet.getString("data"));
				resposta.setHora(resultSet.getString("hora"));
				respostas.add(resposta);
			}

			resultSet.close();
			preparedStatement.close();
			return respostas;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public int editaResposta(EdicaoTicket edicaoTicket, String resposta) {

		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "update respostasTickets set resposta=? where id=?";

			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, resposta);
			preparedStatement.setInt(2, edicaoTicket.getIdResposta());

			preparedStatement.executeUpdate();

			sql = "insert into edicaoTickets(idResposta,edicaoIdUsuario,edicaoNomeUsuario,edicaoSobrenomeUsuario,edicaoNivelUsuario,edicaoData,edicaoHora) values (?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, edicaoTicket.getIdResposta());
			preparedStatement.setInt(2, edicaoTicket.getEdicaoIdUsuario());
			preparedStatement.setString(3, edicaoTicket.getEdicaoNomeUsuario());
			preparedStatement.setString(4, edicaoTicket.getEdicaoSobrenomeUsuario());
			preparedStatement.setString(5, edicaoTicket.getEdicaoNivelUsuario());
			preparedStatement.setString(6, edicaoTicket.getEdicaoData());
			preparedStatement.setString(7, edicaoTicket.getEdicaoHora());

			int resultado = preparedStatement.executeUpdate();

			return resultado;

		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public List<EdicaoTicket> buscaEdicoesTickets() {
		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select distinct * from edicaoTickets where id in (select max(id) as ultimaEdicao from edicaoTickets  group by idResposta);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<EdicaoTicket> edicoesTickets = new ArrayList<EdicaoTicket>();
			while (resultSet.next()) {
				EdicaoTicket edicaoTicket = new EdicaoTicket();

				edicaoTicket.setId(resultSet.getInt("id"));
				edicaoTicket.setIdResposta(resultSet.getInt("idResposta"));
				edicaoTicket.setEdicaoNomeUsuario(resultSet.getString("edicaoNomeUsuario"));
				edicaoTicket.setEdicaoSobrenomeUsuario(resultSet.getString("edicaoSobrenomeUsuario"));
				edicaoTicket.setEdicaoNivelUsuario(resultSet.getString("edicaoNivelUsuario"));
				edicaoTicket.setEdicaoData(resultSet.getString("edicaoData"));
				edicaoTicket.setEdicaoHora(resultSet.getString("edicaoHora"));

				edicoesTickets.add(edicaoTicket);
			}
			resultSet.close();
			preparedStatement.close();
			return edicoesTickets;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public List<Usuario> buscaCoordenadores() {
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from usuarios where nivel='Coordenador'";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Usuario> coordenadores = new ArrayList<Usuario>();
			while (resultSet.next()) {
				Usuario coordenador = new Usuario();

				coordenador.setId(resultSet.getInt("id"));
				coordenador.setNome(resultSet.getString("nome"));
				coordenador.setSobrenome(resultSet.getString("sobrenome"));
				coordenador.setEmail(resultSet.getString("email"));
				coordenador.setSenha(resultSet.getString("senha"));
				coordenador.setNivel(resultSet.getString("nivel"));
				coordenador.setStatus(resultSet.getInt("status"));

				coordenadores.add(coordenador);
			}
			resultSet.close();
			preparedStatement.close();
			return coordenadores;
		} catch (SQLException e) {
			System.out.println("Conexao nao estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

}
