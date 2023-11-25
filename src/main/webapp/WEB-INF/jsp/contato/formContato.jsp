<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<s:layout-render name="/WEB-INF/jsp/commons/layout.jsp" title="Página Principal">
	<s:layout-component name="body">

	<div class="row p-3">
        <div class="col-md-12">
            <c:choose>
                <c:when test="${not empty actionBean.contato.idContato}" >
                    <h4>Editar Cliente</h4>
                </c:when>
                <c:otherwise>
                    <h4>Inserir Cliente</h4>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <s:errors globalErrorsOnly="true" />

    <s:messages />

	<div class="row">
        <div class="col-md-12">

            <s:form beanclass="training.actionbeans.contato.ContatoActionBean" method="post" focus="contato.nome">

                <s:hidden name="contato.idContato" />

                <div class="form-group mb-4">
                    <s:label for="contato.nome" />
                    <s:text name="contato.nome" maxlenght="100" class="form-control" />
                    <s:errors field="contato.nome" />
                    <small id="emailHelp" class="form-text text-muted">Digite seu nome acima</small>
                </div>


                <div class="form-group mb-4">
                    <s:label for="contato.telefone" />
                    <s:text name="contato.telefone" maxlenght="25" class="form-control" />
                    <s:errors field="contato.telefone" />
                </div>

                <div class="form-group mb-4">
                    <s:label for="contato.estadoCivil" />
                    <s:select name="contato.estadoCivil" class="form-control" >
                        <s:option value="">Escolha...</s:option>
                        <s:options-collection collection="${actionBean.estadosCivis}" />
                    </s:select>
                    <s:errors field="contato.estadoCivil" />
                </div>

                <div class="form-group mb-2">
                    <s:submit name="salvar" value="Salvar Agora" class="btn btn-primary" />
                </div>

                <div class="form-group mb-2">
                    <s:submit name="exibeLista" value="Voltar" class="btn btn-secondary" />
                </div>
            </s:form>

        </div>
    </div>

	</s:layout-component>
</s:layout-render>
