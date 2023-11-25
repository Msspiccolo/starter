<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<div class="row">
    <div class="col-md-12">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <a class="navbar-brand" href="${contextPath}">Home</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav">
                      <s:link class="nav-item nav-link" beanclass="training.actionbeans.contato.ContatoActionBean">Cliente</s:link>
                      <s:link class="nav-item nav-link" beanclass="training.actionbeans.pet.PetActionBean">Pets</s:link>
                  </div>
              </div>
        </nav>
    </div>
</div>
