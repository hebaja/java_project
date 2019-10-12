<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Livros de Java, Android, iPhone, PHP, Ruby e muito mais - Casa do Código</title>

<c:url value="/resources/css_bootstrap" var="cssPath"/>
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css" >

<style type="text/css">
    body {
        padding-top: 80px;
    }
</style>

</head>
<body>

	<div class="container fixed-top">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">Casa do Código</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
			  	<li class="nav-item active"> 
				  <a class="nav-link" href="${s:mvcUrl('PC#listar').build() }">Lista de Produtos<span class="sr-only">(current)</span></a>
				</li>
			  	<li class="nav-item active"> 
				  <a class="nav-link" href="${s:mvcUrl('PC#form').build() }">Cadastro de Produtos</a>
				</li>
			</ul>
		 </div>
		</nav>
	</div>
	
	<div class="container">
		
	<form:form action="${s:mvcUrl('PC#gravar').build() }" method="post" commandName="produto" enctype="multipart/form-data">
		<div class="form-group">
			<label>Titulo</label>
			<form:input path="titulo" cssClass="form-control"/>
			<form:errors path="titulo"/>
		</div>
		<div class="form-group">
			<label>Descrição</label>
			<form:textarea path="descricao" cssClass="form-control"/>
			<form:errors path="descricao"/>
		</div>
		<div class="form-group">
			<label>Páginas</label>
			<form:input path="paginas" cssClass="form-control"/>
			<form:errors path="paginas"/>
		</div>
		<div class="form-group">
			<label>Data de Lançamento</label>
			<form:input path="dataLancamento" cssClass="form-control"/>
			<form:errors path="dataLancamento"/>
		</div>
		<c:forEach items="${tipos }" var="tipoPreco" varStatus="status">
			<div class="form-group">
				<label>${tipoPreco }</label>
				<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
				<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco }" />
			</div>
		</c:forEach>	
		<div class="form-group">
			<label>Sumário</label>
			<input name="sumario" type="file" class="form-control"/>
		</div>	
		
		<button type="submit" class="btn btn-primary">Cadastrar</button>
	</form:form>
	</div>
</body>
</html>
				
	
	
	