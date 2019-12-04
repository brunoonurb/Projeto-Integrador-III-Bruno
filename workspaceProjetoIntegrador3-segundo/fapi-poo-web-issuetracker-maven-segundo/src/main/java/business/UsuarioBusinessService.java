package business;

import dao.implement.UsuarioDaoImplement;
import dao.interfaces.UsuarioDaoInterface;
import model.Usuario;

public class UsuarioBusinessService {

	UsuarioDaoInterface usuarioDao = new UsuarioDaoImplement();

	public int cadastrarUsuario(Usuario usuario) {
		return usuarioDao.createUser(usuario);
	}

	public Usuario buscarUsuario(String email, String senha) {
		return usuarioDao.retrieveUser(email, senha);
	}
	
	public int alterarSenha(String senha, int id) {
		return usuarioDao.changePassword(senha,id);
	}
}
