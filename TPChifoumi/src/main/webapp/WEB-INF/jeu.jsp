<%@page import="fr.eni.chifoumi.bo.ActionPossibles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- directive page -->
    <!-- ajout contenu html5 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Jeu Chifoumi </title>
</head>
<body>

<h1>Jouez !</h1>
	<a href="<%=request.getContextPath()%>/jeu?choix=<%=ActionPossibles.CHI%>">
		<img width="75" src="<%=request.getContextPath()%>/images/chi.png"/>
	</a>
	<a href="<%=request.getContextPath()%>/jeu?choix=<%=ActionPossibles.FOU%>">
		<img width="75" src="<%=request.getContextPath()%>/images/fou.png"/>
	</a>
	<a href="<%=request.getContextPath()%>/jeu?choix=<%=ActionPossibles.MI%>">
		<img width="75"  src="<%=request.getContextPath()%>/images/mi.png"/>
	</a>
	
	<form action="<%=request.getContextPath()%>/jeu" method="post">
		<ul>
			<li>
				<label for="choix<%=ActionPossibles.CHI%>"><img width="75"  src="<%=request.getContextPath()%>/images/chi.png"/></label>
				<input type="radio" id="choix<%=ActionPossibles.CHI%>" name="choix" value="<%=ActionPossibles.CHI%>"/>
			</li>
			<li>
				<label for="choix<%=ActionPossibles.FOU%>"><img width="75"  src="<%=request.getContextPath()%>/images/fou.png"/></label>
				<input type="radio" id="choix<%=ActionPossibles.FOU%>" name="choix" value="<%=ActionPossibles.FOU%>"/>
			</li>
			<li>
				<label for="choix<%=ActionPossibles.MI%>"><img width="75"  src="<%=request.getContextPath()%>/images/mi.png"/></label>
				<input type="radio" id="choix<%=ActionPossibles.MI%>" name="choix" value="<%=ActionPossibles.MI%>"/>
			</li>
		</ul>
		<input type="submit" value="Valider">
	</form>
</body>


</html>