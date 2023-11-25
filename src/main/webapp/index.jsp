<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<s:url var="url" beanclass="training.actionbeans.IndexActionBean" prependContext="false" />
<c:redirect url="${url}" />
