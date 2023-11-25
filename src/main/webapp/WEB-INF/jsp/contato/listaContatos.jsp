<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<s:layout-render name="/WEB-INF/jsp/commons/layout.jsp" title="Página Principal">
	<s:layout-component name="body">

	<div class="row p-3">
        <div class="col-md-12">
            <h4>Cadastro de Clientes</h4>
        </div>
    </div>

    <s:errors globalErrorsOnly="true" />

    <s:messages />


    <s:form beanclass="training.actionbeans.contato.ContatoActionBean" method="post" class="form-inline" >

        <div class="form-group mx-sm-3 mb-2">
            <s:label for="filtro.nome" />
            <s:text name="filtro.nome" id="filtro.nome" maxlenght="100" class="form-control" />
            <small id="emailHelp" class="form-text text-muted">Digite seu nome acima</small>
        </div>


        <div class="form-group mx-sm-3 mb-2">
            <s:label for="filtro.telefone" />
            <s:text name="filtro.telefone" id="filtro.telefone" maxlenght="25" class="form-control" />
        </div>

        <div class="form-group mx-sm-3 mb-2">
            <s:submit name="exibeLista">Filtrar</s:submit>
        </div>

        <div class="form-group mx-sm-3 mb-2">
            <s:submit name="preparaInserir">Inserir</s:submit>
        </div>
    </s:form>


    <div class="row">

        <div class="col-md-12">

            <display:table class="table table-striped" id="row" name="actionBean.contatosList" >

                <display:column title="Ações">
                    <s:link
                        beanclass="training.actionbeans.contato.ContatoActionBean"
                        event="preparaEditar" class="">
                        <fmt:message key="label.editar" />
                        <s:param name="contato.idContato"><c:out value="${row.idContato}" /></s:param>
                    </s:link>

                    <s:link beanclass="training.actionbeans.contato.ContatoActionBean"
                            event="excluir" class=""
                            onclick="javascript:return confirm(mensagemConfirmaExclusao);">
                        <fmt:message key="label.excluir"/>
                        <s:param name="contato.idContato"><c:out value="${row.idContato}" /></s:param>
                    </s:link>
                </display:column>

                <display:column property="nome" titleKey="label.contato.nome" escapeXml="true"/>

                <display:column property="telefone" titleKey="label.contato.telefone" escapeXml="true"/>

            </display:table>

        </div>

    </div>

	</s:layout-component>
</s:layout-render>
