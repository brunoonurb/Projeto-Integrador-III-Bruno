package dao.interfaces;

import java.util.List;

import model.LogAcao;
import model.LogAcesso;

public interface LogDaoInterface {

	
	int createAcessLog(LogAcesso logAcesso);
	
	int createActionLog(LogAcao logAcao);

	List<LogAcesso> retrieveAcessLogs();

	List<LogAcao> retrieveActionLogs();

	
	
}
