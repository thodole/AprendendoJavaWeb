package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.PerfilDAO;


public class GerirMenuPerfil extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerirMenuPerfil</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                String opcao = request.getParameter("opcao");
                int idMenu = Integer.parseInt(request.getParameter("idMenu"));
                int idPerfil = Integer.parseInt(request.getParameter("idPerfil"));

                PerfilDAO perfilBD = new PerfilDAO();
                perfilBD.conectar();
                
                String mensagem = "Menu vinculado com sucesso.";
                if (opcao.equals("vincular")) {
                    perfilBD.vincularMenu(idMenu, idPerfil);
                } else if (opcao.equals("desvincular")) {
                    perfilBD.desvincularMenu(idMenu, idPerfil);
                    mensagem = "Menu desvinculado com sucesso.";
                }
                perfilBD.desconectar();
                out.print("<script language='javascript'>");
                out.print("alert('"+mensagem+"');");
                out.print("location.href='formGerirMenuPerfil.jsp?id="+idPerfil+"';");
                out.print("</script>");

            } catch (Exception e) {
                out.print(e);
            }

            out.println("</body>");
            out.println("</html>");

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
