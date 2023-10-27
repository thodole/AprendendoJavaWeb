package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Menu;
import modelo.MenuDAO;

public class AlterarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet AlterarMenu</title>");  
                out.println("</head>");
                out.println("<body>");

                int id = Integer.parseInt(request.getParameter("id"));
                String nome_menu = request.getParameter("nome_menu");
                String link = request.getParameter("link");
                
                if (nome_menu == null || nome_menu.equals("")) {
                    out.print("O campo Nome deve ser preenchido!");
                } else {
                    try {
                        Menu menu = new Menu();
                        menu.setId(id);
                        menu.setNome_menu(nome_menu);
                        menu.setLink(link);
                        MenuDAO menuBD = new MenuDAO();
                        menuBD.conectar();
                        menuBD.alterar(menu);
                        menuBD.desconectar();
                        out.print("<script language='javascript'>");
                        out.print("alert('Menu alterado com sucesso.');");
                        out.print("location.href='listarMenu.jsp';");
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
