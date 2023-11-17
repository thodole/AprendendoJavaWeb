package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.UsuarioDAO;

public class GerirServicoCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerirServicoCliente</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                String opcao = request.getParameter("opcao");
                int idServico = Integer.parseInt(request.getParameter("idServico"));
<<<<<<< Updated upstream
=======
<<<<<<< HEAD:ClaudiaCabeleireiros/src/java/controle/InserirServicoCliente.java
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                String quantidade = request.getParameter("quantidade");
                double valor_servico = Double.parseDouble(request.getParameter("valor_servico"));

            if (idServico < 1) {
                out.print("Selecione um Serviço!");
            } else if (idCliente < 1) {
                out.print("Cliente não encontrado!");
            } else if (quantidade == null || quantidade.equals("")) {
                out.print("<script language='javascript'>");
                    out.print("alert('Quantidade inválida!');");
                    out.print("location.href='formInserirServicoCliente.jsp?id="+idCliente+"';");
                    out.print("</script>");
            } else if (valor_servico <= 0) {
                out.print("Valor não definido!");
            } else {
                int quantidade2 = Integer.parseInt(request.getParameter("quantidade"));
                    if (quantidade2 <= 0) {
                        out.print("<script language='javascript'>");
                        out.print("alert('Quantidade inválida!');");
                        out.print("location.href='formInserirServicoCliente.jsp?id="+idCliente+"';");
                        out.print("</script>");
                    } else {
                        try {
                            ServicoCliente servicoCliente = new ServicoCliente();
                            servicoCliente.setIdServico(idServico);
                            servicoCliente.setIdCliente(idCliente);
                            servicoCliente.setQuantidade(quantidade2);
                            servicoCliente.setValor_servico(valor_servico*quantidade2);
                            ServicoClienteDAO servicoClienteBD = new ServicoClienteDAO();
                            servicoClienteBD.conectar();
                            servicoClienteBD.inserir(servicoCliente);
                            servicoClienteBD.desconectar();
                            out.print("<script language='javascript'>");
                            out.print("alert('Serviço incluído com sucesso.');");
                            out.print("location.href='formInserirServicoCliente.jsp?id="+idCliente+"';");
                            out.print("</script>");
                        } catch (Exception erro) {
                            out.print(erro);
                        }

                    }
=======
>>>>>>> Stashed changes
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

                UsuarioDAO usuarioBD = new UsuarioDAO();
                usuarioBD.conectar();
                
                String mensagem = "Serviço incluído com sucesso.";
                if (opcao.equals("incluir")) {
                    usuarioBD.vincularServico(idServico, idUsuario);
                } else if (opcao.equals("excluir")) {
                    usuarioBD.desvincularServico(idServico, idUsuario);
                    mensagem = "Serviço excluído com sucesso.";
                }
                usuarioBD.desconectar();
                out.print("<script language='javascript'>");
                out.print("alert('"+mensagem+"');");
                out.print("location.href='formGerirServicoCliente.jsp?id="+idUsuario+"';");
                out.print("</script>");

            } catch (Exception e) {
                out.print(e);
            }
<<<<<<< Updated upstream

            out.println("</body>");
            out.println("</html>");

        } finally {
            out.close();
=======
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101:ClaudiaCabeleireiros/src/java/controle/GerirServicoCliente.java

                    out.println("</body>");
                    out.println("</html>");

<<<<<<< HEAD:ClaudiaCabeleireiros/src/java/controle/InserirServicoCliente.java
        }
            } finally { 
                out.close();
=======
        } finally {
            out.close();
>>>>>>> d14b050a8b699180837da4149e8fe0ff57f0a101:ClaudiaCabeleireiros/src/java/controle/GerirServicoCliente.java
>>>>>>> Stashed changes
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
