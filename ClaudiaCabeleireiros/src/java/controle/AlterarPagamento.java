package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Pagamento;
import modelo.PagamentoDAO;

public class AlterarPagamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet AlterarPagamento</title>");  
                out.println("</head>");
                out.println("<body>");

                int idPagamento = Integer.parseInt(request.getParameter("idPagamento"));
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                Double valorPago = Double.parseDouble(request.getParameter("valorPago"));
                Double valorAPagar = Double.parseDouble(request.getParameter("valorAPagar"));
                Double pagar = Double.parseDouble(request.getParameter("pagar"));
                
                if (idPagamento < 0) {
                    out.print("Pagamento não encontrado!");
                } if (idCliente < 0) {
                    out.print("Cliente não encontrado!");
                } if (valorAPagar == 0) {
                    out.print("Não existe valor a pagar!");
                } if (pagar <= 0) {
                    out.print("Digite um valor maior que zero no campo Pagar!");
                } if (pagar > valorAPagar) {
                    out.print("O Valor Pago é maior que o Valor a Pagar!");
                } else {
                    try {
                        Pagamento pagamento = new Pagamento();
                        pagamento.setId(idPagamento);
                        pagamento.setValorPago(valorPago + pagar);
                        pagamento.setValorAPagar(valorAPagar - pagar);
                        PagamentoDAO pagamentoBD = new PagamentoDAO();
                        pagamentoBD.conectar();
                        pagamentoBD.alterar(pagamento);
                        pagamentoBD.desconectar();
                        out.print("<script language='javascript'>");
                        out.print("alert('Pagamento efetuado com sucesso.');");
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
