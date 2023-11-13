package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ServicoCliente;
import modelo.ServicoClienteDAO;


public class InserirServicoCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirServicoCliente</title>");
            out.println("</head>");
            out.println("<body>");

                int idServico = Integer.parseInt(request.getParameter("idServico"));
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                double valor_servico = Double.parseDouble(request.getParameter("valor_servico"));

            if (idServico < 1) {
                out.print("Selecione um Serviço!");
            } else if (idCliente < 1) {
                out.print("Cliente não encontrado!");
            } else if (quantidade < 0) {
                out.print("Defina a quantidade!");
            } else if (valor_servico <= 0) {
                out.print("Valor não definido!");
            } else {
                try {
                    ServicoCliente servicoCliente = new ServicoCliente();
                    servicoCliente.setIdServico(idServico);
                    servicoCliente.setIdCliente(idCliente);
                    servicoCliente.setQuantidade(quantidade);
                    servicoCliente.setValor_servico(valor_servico*quantidade);
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
