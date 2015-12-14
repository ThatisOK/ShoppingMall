package shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;

import tool.Message;

/**
 * Servlet implementation class ShoppingCart
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String operation = request.getParameter("operation");
		String id = request.getParameter("id");
		int amount = 0;
		if(request.getParameter("amount") != null){
			amount = Integer.parseInt(request.getParameter("amount"));
		}	
		ShoppingCart cart = new ShoppingCart();
		HttpSession session = request.getSession();
		Message msg = new Message();
		int errno = 1;
		switch(operation){
		case "add":
			cart.addGood(id, amount, session);
			msg.sendJson(response, errno, "success");
			break;
		case "delete":
			errno = cart.removeGood(id, session);
			msg.sendJson(response, errno, "success");
			break;
		case "update":
			errno = cart.updateGood(id, amount, session);
			msg.sendJson(response, errno, "success");
			break;
		}
	}

}
