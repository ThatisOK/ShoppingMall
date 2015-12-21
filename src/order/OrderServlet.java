package order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Message;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		Message msg = new Message();
		OrderDao od = new OrderDao();
		Order order = new Order();
		String operation = request.getParameter("operation");
		switch(operation){
		case "add":
			order.setReciver(request.getParameter("reciver"));
			order.setPhone(request.getParameter("phone"));
			order.setAddress(request.getParameter("address"));
			order.setMessage(request.getParameter("message"));
			String username = request.getParameter("username");
			String[] goodToNum = request.getParameter("data").split(";");
			int errno = od.addOrder(order, goodToNum, username);
			msg.sendJson(response, errno, "success");
		}
		
	}

}
