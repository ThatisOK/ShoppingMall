package user;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import tool.Md5;
import tool.Message;


/**
 * Servlet implementation class User
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 用户名 			明文
	 * 密码 				md5密文
	 * 数据库中的用户名 	明文
	 * 数据库中的密码  	明文
	 * 成功 return success
	 * 失败 return failure
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession  session = request.getSession();
		Message msg = new Message();
		switch(action){
		case "signIn":{
			String Username = request.getParameter("username");
			String Password = request.getParameter("password");
			Md5 md5 = new Md5();
			UserDao ud = new UserDao();
			String passwordMd5 = md5.Encryption(ud.userLogin(Username.trim()));
			if(Password.equals(passwordMd5)){
				session.setAttribute("user", Username);
				msg.sendJson(response, 0, "success");
			
			}
			else{
				msg.sendJson(response, -1, "failure");
			}
			break;
			}
		case "signOut":{
			session.removeAttribute("user");
			msg.sendJson(response, 0, "SignOutSuccess");
			break;
			}
		case "signUp":{
			String Username = request.getParameter("username");
			String Password = request.getParameter("password");
			UserDao ud = new UserDao();
			ud.userAdd(Username, Password);
			session.setAttribute("user", Username);
			msg.sendJson(response, 0, "SignUpSuccess");
			}
		}
		
			
	}
	

}
