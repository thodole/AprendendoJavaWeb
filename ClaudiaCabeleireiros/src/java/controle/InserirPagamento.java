package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Pagamento;
import modelo.PagamentoDAO;
import modelo.ServicoCliente;
import modelo.ServicoClienteDAO;

public class InserirPagamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirPagamento</title>");
            out.println("</head>");
            out.println("<body>");

            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            double valorTotal = Double.parseDouble(request.getParameter("valorTotal"));
            double valorPago = Double.parseDouble(request.getParameter("valorPago"));
                        
            if (valorTotal <= 0) {
                out.print("Não há valor a ser pago!");
            } else if (valorPago < 0) {
                out.print("O Valor Pago deve ser acima de zero!");
            } else {
                try {
                    ServicoCliente servicoCliente = new ServicoCliente();
                    servicoCliente.setIdCliente(idCliente);
                    Pagamento pagamento = new Pagamento();
                    pagamento.setIdCliente(idCliente);
                    pagamento.setValorTotal(valorTotal);
                    pagamento.setValorPago(valorPago);
                    pagamento.setValorAPagar(valorTotal - valorPago);
                    PagamentoDAO pagamentoBD = new PagamentoDAO();
                    ServicoClienteDAO servicoClienteBD = new ServicoClienteDAO();
                    pagamentoBD.conectar();
                    pagamentoBD.inserir(pagamento);
                    pagamentoBD.desconectar();
                    servicoClienteBD.conectar();
                    servicoClienteBD.deletarServico(servicoCliente);
                    servicoClienteBD.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Pagamento inserido com sucesso.');");
                    out.print("location.href='situacaoCliente.jsp?id="+idCliente+"';");
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
