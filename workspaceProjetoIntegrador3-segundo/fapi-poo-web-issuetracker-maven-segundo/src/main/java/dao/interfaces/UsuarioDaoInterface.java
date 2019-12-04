package dao.interfaces;

import model.Usuario;

public interface UsuarioDaoInterface {

	int createUser(Usuario usuario);
	
	Usuario retrieveUser(String email,String senha);

	int changePassword(String senha, int id);
	
	
}
