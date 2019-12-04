package business;

import java.util.List;

import dao.implement.LogDaoImplement;
import dao.interfaces.LogDaoInterface;
import model.LogAcao;
import model.LogAcesso;

public class LogBusinessService {

	LogDaoInterface logDao = new LogDaoImplement();
	
	public int cadastrarLogAcesso(LogAcesso logAcesso) {
		return logDao.createAcessLog(logAcesso);
	}
	
	public int cadastrarLogAcao(LogAcao logAcao) {
		return logDao.createActionLog(logAcao);
	}

	public List<LogAcesso> listarLogAcessos() {
		
		return logDao.retrieveAcessLogs();
	}

	public List<LogAcao> listarLogAcoes() {
		
		return logDao.retrieveActionLogs();
	}
	
}
