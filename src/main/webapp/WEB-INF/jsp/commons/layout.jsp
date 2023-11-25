<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<s:layout-definition>
	<%-- Este é o layout comum entre todas as páginas --%>
	<!DOCTYPE html>
	<html lang="pt-BR">
		<head>
		    <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

            <script>
                // Variavel com mensagem internacionalizada para exibir antes de excluir um registro
                const mensagemConfirmaExclusao = '<fmt:message key="message.confirmaExclusao" />'
            </script>

		    <title>${title}</title>
		</head>

		<body>

            <div class="container">
                <jsp:include page="/WEB-INF/jsp/commons/topbanner.jsp" />

                <jsp:include page="/WEB-INF/jsp/commons/menu.jsp" />

		        <s:layout-component name="body" />

		        <jsp:include page="/WEB-INF/jsp/commons/footer.jsp" />

		    </div>

		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
		</body>
	</html>
</s:layout-definition>
