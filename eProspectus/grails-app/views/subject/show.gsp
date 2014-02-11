
<%@ page import="eprospectus.Subject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subject.label', default: 'Subject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subject">
			
				<g:if test="${subjectInstance?.courses}">
				<li class="fieldcontain">
					<span id="courses-label" class="property-label"><g:message code="subject.courses.label" default="Courses" /></span>
					
						<g:each in="${subjectInstance.courses}" var="c">
						<span class="property-value" aria-labelledby="courses-label"><g:link controller="courseSubject" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.subjCode}">
				<li class="fieldcontain">
					<span id="subjCode-label" class="property-label"><g:message code="subject.subjCode.label" default="Subj Code" /></span>
					
						<span class="property-value" aria-labelledby="subjCode-label"><g:fieldValue bean="${subjectInstance}" field="subjCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subjectInstance?.subjName}">
				<li class="fieldcontain">
					<span id="subjName-label" class="property-label"><g:message code="subject.subjName.label" default="Subj Name" /></span>
					
						<span class="property-value" aria-labelledby="subjName-label"><g:fieldValue bean="${subjectInstance}" field="subjName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subjectInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subjectInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
