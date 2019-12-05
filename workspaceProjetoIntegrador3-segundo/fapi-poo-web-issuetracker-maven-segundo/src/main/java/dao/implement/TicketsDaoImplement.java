package dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.MysqlConnection;
import dao.TicketsDaoInterface;
import model.ResnposeHome;
import model.Resposta;
import model.Ticket;

public class TicketsDaoImplement implements TicketsDaoInterface {

	@Override
	public int ciarTicket(Ticket ticket) {
		try (Connection connection = MysqlConnection.abrirConexao()) {

			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into tickets (idCliente,nomeCliente,status,hora,data) values (?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);

			preparedStatement.setInt(1, ticket.getIdCliente());
			preparedStatement.setString(2, ticket.getNomeCliente());
			preparedStatement.setInt(3, ticket.getStatus());
			preparedStatement.setString(4, ticket.getHora());
			preparedStatement.setString(5, ticket.getData());
			int resposta = preparedStatement.executeUpdate();
			
			
			if (resposta == 1) {
				System.out.println("Registro inserido");
				ResultSet res = preparedStatement.getGeneratedKeys();
				if (res.first()) {
					System.out.println("Codigo ID gerado: " + res.getInt(1));
					resposta =res.getInt(1);
				}
				preparedStatement.close();
				res.close();
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
	public int finalizarTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		System.out.println("\n implement\n\n"+ticket.toString());
		try (Connection connection = MysqlConnection.abrirConexao()) {

			PreparedStatement preparedStatement = connection.prepareStatement(
					"update tickets set status = ?,assunto=?,descricao=?,hora=?,data=?,tempoCriacao=?,linkPrint=? where id=?",
					Statement.RETURN_GENERATED_KEYS);

			preparedStatement.setInt(1, ticket.getStatus());
			preparedStatement.setString(2, ticket.getAssunto());
			preparedStatement.setString(3, ticket.getDescricao());
			preparedStatement.setString(4, ticket.getHora());
			preparedStatement.setString(5, ticket.getData());
			preparedStatement.setString(6, ticket.getTempoCriacao());
			preparedStatement.setString(7, ticket.getLinkPrint());
			preparedStatement.setInt(8, ticket.getId());
			int resposta = preparedStatement.executeUpdate();

			preparedStatement.close();
			return resposta;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public List<Ticket> listarTodosTickets(int idCliente) {

		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql 	= "SELECT tickets.* ,case(tickets.status) "
					+ "when '2' then '1' "
					+ "when '3' then '1' "
					+ "when '4' then '1' "
					+ "when '5' then '2' "
					+ "when '6' then '1' "
					+ "when '7' then '3' "
					+ "when '8' then '3' when '9' then '1' "
					+ "else '0' end as 'falsoStatus' FROM tickets "
					+ "inner join usuarios on usuarios.id = tickets.idCliente "
					+ "inner join clientesEmpresas on usuarios.id = clientesEmpresas.idCliente "
					+ "where clientesEmpresas.idEmpresa =  any(select idEmpresa from clientesEmpresas where ClientesEmpresas.idCliente = ?) "
					+ "order by tickets.id desc";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idCliente);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Ticket> tickets = new ArrayList<Ticket>();

			while (resultSet.next()) {
				Ticket ticket = new Ticket();
				ticket.setId(resultSet.getInt("id"));
				ticket.setIdCliente(resultSet.getInt("idCliente"));
				ticket.setNomeCliente(resultSet.getString("nomeCliente"));
				ticket.setAssunto(resultSet.getString("assunto"));
				ticket.setDescricao(resultSet.getString("descricao"));
				ticket.setStatus(resultSet.getInt("falsoStatus"));
				ticket.setLinkPrint(resultSet.getString("linkPrint"));
				ticket.setData(resultSet.getString("data"));
				ticket.setHora(resultSet.getString("hora"));
				ticket.setTempoCriacao(resultSet.getString("tempoCriacao"));
				tickets.add(ticket);
			}

			resultSet.close();
			preparedStatement.close();
			
			return tickets;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}

	}

	@Override
	public List<ResnposeHome> listaHome(int idCliente) {

		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql 	= "select clientesEmpresas.idEmpresa as 'id_empresa', tickets.data as 'data_t' "
					+ ",(select count(tickets.id) from tickets where tickets.status = 1 and tickets.data = data_t  and idCliente = any(select idcliente from clientesEmpresas where ClientesEmpresas.idEmpresa = id_empresa)) as 'novo' "
					+ " ,(select count(tickets.id) from tickets where tickets.status = 8 and tickets.data = data_t and idCliente = any(select idcliente from clientesEmpresas where ClientesEmpresas.idEmpresa = id_empresa)) as 'finalizado' "
					+ ",(select count(tickets.id) from tickets where tickets.status != 8 and tickets.data = data_t  and idCliente = any(select idcliente from clientesEmpresas where ClientesEmpresas.idEmpresa = id_empresa)) as 'processo' "
					+ "from tickets"
					+ " inner join clientesEmpresas on tickets.idCliente = clientesEmpresas.idCliente"
					+ " where clientesEmpresas.idEmpresa =  any(select idEmpresa "
					+ "from clientesEmpresas where ClientesEmpresas.idCliente = ?) "
					+ "group by tickets.data;";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idCliente);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<ResnposeHome> resnposeHome = new ArrayList<ResnposeHome>();

			while (resultSet.next()) {
				ResnposeHome resHome = new ResnposeHome();
				resHome.setData(resultSet.getString("data_t"));
				resHome.setNovo(resultSet.getInt("novo"));
				resHome.setFinalizado(resultSet.getInt("finalizado"));
				resHome.setProcesso(resultSet.getInt("processo"));
				resnposeHome.add(resHome);
			}

			resultSet.close();
			preparedStatement.close();
			
			return resnposeHome;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@Override
	public int adicionarResposta(Resposta resposta) {
		// TODO Auto-generated method stub
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {

			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into respostasTickets (idTicket,idUsuario,nomeUsuario,nivelUsuario,resposta,hora,data) values (?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			
			preparedStatement.setInt(1, resposta.getIdTicket());
			preparedStatement.setInt(2, resposta.getIdUsuario());
			preparedStatement.setString(3, resposta.getNomeUsuario());
			preparedStatement.setString(4, resposta.getNivelUsuario());
			preparedStatement.setString(5, resposta.getResposta());
			preparedStatement.setString(6, resposta.getHora());
			preparedStatement.setString(7, resposta.getData());
			int resultado = preparedStatement.executeUpdate();

			if (resultado == 1) {
				System.out.println("Registro inserido");
				ResultSet res = preparedStatement.getGeneratedKeys();
				if (res.first()) {
					System.out.println("Codigo ID gerado: " + res.getInt(1));
				}
				res.close();
				preparedStatement.close();
				return resultado;
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
	public List<Resposta> listarRespostas() {
		// TODO Auto-generated method stub
		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from respostasTickets";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Resposta> respostas = new ArrayList<Resposta>();

			while (resultSet.next()) {
				Resposta resposta = new Resposta();
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
	public int mudarSituacaoTicket(int statusTicket, int idTicket) {
		// TODO Auto-generated method stub
		
		try (Connection connection = MysqlConnection.abrirConexao()) {
			System.out.println("conect");

			String sql = "update tickets set status=? where id=? ";
			PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			preparedStatement.setInt(1, statusTicket);
			preparedStatement.setInt(2, idTicket);
			
			int resultado = preparedStatement.executeUpdate();
			preparedStatement.close();

			return resultado;
		} catch (SQLException e) {
			System.out.println("Conex�o n�o estabelecida.");
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public Ticket buscarTicket(int id) {
		// TODO Auto-generated method stub
		try (java.sql.Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select * from tickets where id = ?";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			Ticket ticket = new Ticket();
			while (resultSet.next()) {				
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
				
			}

			resultSet.close();
			preparedStatement.close();
			return ticket;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}

	}

	@Override
	public List<Ticket> listarTicketsResolvidos(int idCliente) {
		// TODO Auto-generated method stub
		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select tickets.*,statusTickets.descricao as explicacao, case(tickets.status) "
					+ "when '2' then '1' "
					+ "when '3' then '1' "
					+ "when '4' then '1' "
					+ "when '5' then '2' "
					+ "when '6' then '1' "
					+ "when '7' then '3' "
					+ "when '8' then '3' "
					+ "when '9' then '1' "
					+ "else '0' end as 'falsoStatus' from tickets"
					+ " inner join statusTickets on tickets.status=statusTickets.id"
					+ " where tickets.idCliente = ? having explicacao in('fechado','resolvido') "
					+ "order by tickets.id desc";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idCliente);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Ticket> tickets = new ArrayList<Ticket>();

			while (resultSet.next()) {
				Ticket ticket = new Ticket();
				ticket.setId(resultSet.getInt("id"));
				ticket.setIdCliente(resultSet.getInt("idCliente"));
				ticket.setNomeCliente(resultSet.getString("nomeCliente"));
				ticket.setAssunto(resultSet.getString("assunto"));
				ticket.setDescricao(resultSet.getString("descricao"));
				ticket.setStatus(resultSet.getInt("falsoStatus"));
				ticket.setLinkPrint(resultSet.getString("linkPrint"));
				ticket.setData(resultSet.getString("data"));
				ticket.setHora(resultSet.getString("hora"));
				ticket.setTempoCriacao(resultSet.getString("tempoCriacao"));
				tickets.add(ticket);
			}

			resultSet.close();
			preparedStatement.close();
			return tickets;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public List<Ticket> listarTicketsPendentes(int idCliente) {
		// TODO Auto-generated method stub
		try (Connection connection = MysqlConnection.abrirConexao()) {
			String sql = "select tickets.*,statusTickets.descricao as explicacao, case(tickets.status) "
					+ "when '2' then '1' "
					+ "when '3' then '1' "
					+ "when '4' then '1' "
					+ "when '5' then '2' "
					+ "when '6' then '1' "
					+ "when '7' then '3' "
					+ "when '8' then '3' "
					+ "when '9' then '1' "
					+ "else '0' end as 'falsoStatus' from tickets "
					+ "inner join statusTickets on tickets.status=statusTickets.id "
					+ "where tickets.idCliente = ? having explicacao in('pendente','atribuido','em progresso','pendente c','pendente t','reaberto') "
					+ "order by tickets.id desc";
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, idCliente);
			ResultSet resultSet = preparedStatement.executeQuery();

			List<Ticket> tickets = new ArrayList<Ticket>();

			while (resultSet.next()) {
				Ticket ticket = new Ticket();
				ticket.setId(resultSet.getInt("id"));
				ticket.setIdCliente(resultSet.getInt("idCliente"));
				ticket.setNomeCliente(resultSet.getString("nomeCliente"));
				ticket.setAssunto(resultSet.getString("assunto"));
				ticket.setDescricao(resultSet.getString("descricao"));
				ticket.setStatus(resultSet.getInt("falsoStatus"));
				ticket.setLinkPrint(resultSet.getString("linkPrint"));
				ticket.setData(resultSet.getString("data"));
				ticket.setHora(resultSet.getString("hora"));
				ticket.setTempoCriacao(resultSet.getString("tempoCriacao"));
				tickets.add(ticket);
			}

			resultSet.close();
			preparedStatement.close();
			return tickets;
		} catch (SQLException e) {
			System.out.println("Conexão não estabelecida.");
			System.out.println(e.getMessage());
			return null;
		}
	}


}
