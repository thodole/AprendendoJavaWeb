package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.UsuarioDAO;

public class AlterarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet AlterarUsuario</title>");  
                out.println("</head>");
                out.println("<body>");

                int id = Integer.parseInt(request.getParameter("id"));
                int idPerfil = Integer.parseInt(request.getParameter("idPerfil"));
                String nome_usuario = request.getParameter("nome_usuario");
                String telefone = request.getParameter("telefone");
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
            
                if (nome_usuario == null || nome_usuario.equals("")) {
                    out.print("O campo Nome deve ser preenchido!");
                } else if (telefone == null || telefone.equals("")) {
                    out.print("O campo Telefone deve ser preenchido!");
                } else if (login == null || login.equals("")) {
                    out.print("O campo Login deve ser preenchido!");
                } else if (senha == null || senha.equals("")) {
                    out.print("O campo Senha deve ser preenchido!");
                } else if (idPerfil < 1) {
                    out.print("O campo Perfil deve ser preenchido!");
                } else if (id < 1) {
                    out.print("O ID do usuário não foi encontrado!");
                } else {
                    try {
                        Usuario usuario = new Usuario();
                        usuario.setId(id);
                        usuario.setIdPerfil(idPerfil);
                        usuario.setNome_usuario(nome_usuario);
                        usuario.setTelefone(telefone);
                        usuario.setLogin(login);
                        usuario.setSenha(senha);
                        UsuarioDAO usuarioBD = new UsuarioDAO();
                        usuarioBD.conectar();
                        usuarioBD.alterar(usuario);
                        usuarioBD.desconectar();
                        out.print("<script language='javascript'>");
                        out.print("alert('Usuário alterado com sucesso.');");
                        out.print("location.href='listarUsuario.jsp';");
                        out.print("</script>");
                        
                    } catch (Exception erro) {
                        out.print(erro);
                    }

                }
                    out.println("</body>");
                    out.println("</html>");
            
            } finally { 
                out.close();
            }   
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
