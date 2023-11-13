package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

public class InserirCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirCliente</title>");
            out.println("</head>");
            out.println("<body>");

            String nome_cliente = request.getParameter("nome_cliente");
            String telefone = request.getParameter("telefone");

            if (nome_cliente == null || nome_cliente.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } if (telefone == null || telefone.equals("")) {
                out.print("O campo Telefone deve ser preenchido!");
            } else {
                try {
                    Cliente cliente = new Cliente();
                    cliente.setNome_cliente(nome_cliente);
                    cliente.setTelefone(telefone);
                    ClienteDAO clienteBD = new ClienteDAO();
                    clienteBD.conectar();
                    clienteBD.inserir(cliente);
                    clienteBD.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Cliente inserido com sucesso.');");
                    out.print("location.href='formInserirCliente.jsp';");
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
