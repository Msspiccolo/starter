<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<s:layout-render name="/WEB-INF/jsp/commons/layout.jsp" title="Página Principal">
	<s:layout-component name="body">

	<div class="row p-3">
        <div class="col-md-12">
            <h4>Cadastro de PET </h4>
        </div>
    </div>

    <s:errors globalErrorsOnly="true" />

    <s:messages />


    <s:form beanclass="training.actionbeans.pet.PetActionBean" method="post" class="form-inline" >

        <div class="form-group mx-sm-3 mb-2">
            <s:label for="filtro.nomePet" />
            <s:text name="filtro.nomePet" id="filtro.nomePet" maxlenght="100" class="form-control" />
            <small id="emailHelp" class="form-text text-muted">Digite o nome do pet acima</small>
        </div>


        <div class="form-group mb-4">
            <s:label for="label.pet.dataNascimento" />
            <input type="date" name="pet.dataNascimento" value="<fmt:formatDate value='${pet.dataNascimento}' pattern='yyyy-MM-dd'/>" class="form-control"/>
            <s:errors field="label.pet.dataNascimento" />
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

            <display:table class="table table-striped" id="row" name="actionBean.pets" >

                <display:column title="Ações">
                    <s:link
                        beanclass="training.actionbeans.pet.PetActionBean"
                        event="preparaEditar" class="">
                        <fmt:message key="label.editar" />
                        <s:param name="pet.idPet"><c:out value="${row.idPet}" /></s:param>
                    </s:link>

                    <s:link beanclass="training.actionbeans.pet.PetActionBean"
                            event="excluir" class=""
                            onclick="javascript:return confirm(mensagemConfirmaExclusao);">
                        <fmt:message key="label.excluir"/>
                        <s:param name="pet.idPet"><c:out value="${row.idPet}" /></s:param>
                    </s:link>
                </display:column>

                <display:column property="nomePet" titleKey="label.pet.nomePet" escapeXml="true"/>

                <display:column property="dataNascimento" titleKey="label.pet.dataNascimento" escapeXml="true"/>

            </display:table>

        </div>

    </div>

	</s:layout-component>
</s:layout-render>
