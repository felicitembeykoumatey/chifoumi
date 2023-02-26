package fr.eni.chifoumi;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Importation des actions il y a 3 actions chi fou et mi
import fr.eni.chifoumi.bo.ActionPossibles;
/**
 * Servlet implementation class ServletChifoumi
 */
@WebServlet("/jeu")
public class ServletChifoumi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("choix")!=null)
		{
			processRequest(request,response);
		}
		else
		{
			//Déléguer la réponse à la JSP jeu.jsp
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jeu.jsp");
			
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	int choixJoueur = Integer.parseInt(request.getParameter("choix"));
	int choixServeur = new Random().nextInt(3)+1;
	/*	POSSIBILITES DES CHOIX  Vous(Joueur) contre Serveur(Joueur)
	 * 
	 *  choixJoueur = choixServeur =>EGALITE (choix identique)
	 *  choixJoueur = CHI et choixServeur = MI => VICTOIRE JOUEUR
	 *  choixJoueur = FOU et choixServeur = CHI => VICTOIRE JOUEUR
	 *  choixJoueur = MI et choixServeur = FOU => VICTOIRE JOUEUR
	 *   
	 *  Dans les autres cas => VICTOIRE SERVEUR
	 *  
	 *  resultat : 0 si égalité, 1 si victoire joueur, -1 si victoire serveur
	 */
	int resultat; //
	if(choixJoueur==choixServeur)
	{
		resultat=0;
	}
	else if(
			(choixJoueur==ActionPossibles.CHI && choixServeur==ActionPossibles.MI)||
			(choixJoueur==ActionPossibles.FOU && choixServeur==ActionPossibles.CHI)||
			(choixJoueur==ActionPossibles.MI && choixServeur==ActionPossibles.FOU)
			)
			
	{
		resultat=1;
	}
	else
	{
		resultat=-1;
	}
	
	//Définir les informations à renvoyer à la JSP (resultat.jsp)
	request.setAttribute("resultat", resultat);
	request.setAttribute("choixJoueur", choixJoueur);
	request.setAttribute("choixServeur", choixServeur);
	
	//Déléguer la réponse à la JSP
	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/resultat.jsp");
	if(rd!=null)
	{
		rd.forward(request, response);
	}
	else
	{
		response.sendError(HttpServletResponse.SC_NOT_FOUND);
	}
	
}

	
	}

	


