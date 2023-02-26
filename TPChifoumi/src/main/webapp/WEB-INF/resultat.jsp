<%@page import="fr.eni.chifoumi.bo.ActionPossibles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Résultat</title>
</head>
<body>

<%
		int choixJoueur = (int)request.getAttribute("choixJoueur");
		int choixServeur = (int)request.getAttribute("choixServeur");
		int resultat = (int)request.getAttribute("resultat");
	%>

<h1>Résultat</h1>
<h2>Choix du joueur !</h2>
	
<%=request.getAttribute("choixJoueur") %>
	<%
		if(choixJoueur==ActionPossibles.CHI)
		{
	%>
			<img width="75"  src="<%=request.getContextPath()%>/images/chi.png"/>
	<% 		
		}
		else if(choixJoueur==ActionPossibles.FOU)
		{
	%>
			<img width="75"  src="<%=request.getContextPath()%>/images/fou.png"/>
	<% 					
		}
		else if(choixJoueur==ActionPossibles.MI)
		{
	%>
			<img width="75"  src="<%=request.getContextPath()%>/images/mi.png"/>
	<% 					
			
		}
		else
		{
			out.print("Je ne comprends pas votre choix.");
		}
	%>
	
	<h2>Choix du serveur !</h2>
	
	<%=request.getAttribute("choixServeur") %>
	<%
		if(choixServeur==ActionPossibles.CHI)
		{
	%>
			<img width="75"  src="<%=request.getContextPath()%>/images/chi.png"/>
	<% 		
		}
		else if(choixServeur==ActionPossibles.FOU)
		{
	%>
			<img width="75"  src="<%=request.getContextPath()%>/images/fou.png"/>
	<% 					
		}
		else if(choixServeur==ActionPossibles.MI)
		{
	%>
			<img width="75"  src="<%=request.getContextPath()%>/images/mi.png"/>
	<% 					
			
		}
		else
		{
			out.print("Je ne comprends pas votre choix.");
		}
	%>
	<h2>Résultat</h2>
	<%=request.getAttribute("resultat") %>
	<%
		if(resultat==0)
		{
			out.write("Egalité! 🙃"); // out.write permet d'Afficher résultat 
		}
		else if(resultat==1)
		{
			out.write("Vous avez gagné 😄!!");
		}
		else
		{
			out.write("Vous avez perdu! 🥴");
		}
	%>
	<div>
		<a href="<%=request.getContextPath() %>/jeu">Rejouer</a>
	</div>
</body>
</html>
