package com.rating.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rating.service.IRatingService;
import com.rating.service.RatingServiceImpl;

/**
 * Servlet implementation class GetRatingServlet
 */
@WebServlet("/GetRatingServlet")
public class GetRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetRatingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String ratingId = request.getParameter("ratingId");

		IRatingService iRatingService = new RatingServiceImpl();
		iRatingService.getRatingById(ratingId);

		request.setAttribute("ratingId", ratingId);
		RequestDispatcher dipatcher = getServletContext().getRequestDispatcher("/updateRatings.jsp");
		dipatcher.forward(request, response);
	}

}
