<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<s:layout-render name="/WEB-INF/jsp/commons/layout.jsp" title="Página Principal">
	<s:layout-component name="body">

	<div class="row p-3">
        <div class="col-md-12">
            <c:choose>
                <c:when test="${not empty actionBean.pet.idPet}" >
                    <h4>Editar Pet</h4>
                </c:when>
                <c:otherwise>
                    <h4>Inserir Pet</h4>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <s:errors globalErrorsOnly="true" />

    <s:messages />

	<div class="row">
        <div class="col-md-12">

            <s:form beanclass="training.actionbeans.pet.PetActionBean" method="post" focus="pet.nomePet">

                <s:hidden name="pet.idPet" />

                <div class="form-group mb-4">
                    <s:label for="pet.nomePet" />
                    <s:text name="pet.nomePet" maxlenght="100" class="form-control" />
                    <s:errors field="pet.nomePet" />
                    <small id="emailHelp" class="form-text text-muted">Digite o nome do seu pet acima</small>
                </div>



                <div class="form-group mb-4">
                    <s:label for="pet.dataNascimento" />
                    <input type="date" name="pet.dataNascimento" value="<fmt:formatDate value='${pet.dataNascimento}' pattern='yyyy-MM-dd'/>" class="form-control"/>
                    <s:errors field="pet.dataNascimento" />
                </div>

                <div class="form-group mb-4">
                    <c:forEach var="genero" items="${actionBean.generos}">
                        <s:radio name="pet.genero" value="${genero}"/>
                        <fmt:message key="${genero}"/>
                    </c:forEach>
                </div>



                <div class="form-group mb-4">
                    <s:label for="pet.racaPet" />
                    <s:select name="pet.racaPet" class="form-control" >
                        <s:option value="">Escolha...</s:option>
                        <s:options-collection collection="${actionBean.raca}" />
                    </s:select>
                    <s:errors field="pet.racaPet" />
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
