
<%@ page import="eprospectus.CourseSubject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseSubject.label', default: 'CourseSubject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-courseSubject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-courseSubject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list courseSubject">
			
				<g:if test="${courseSubjectInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="courseSubject.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${courseSubjectInstance?.course?.id}">${courseSubjectInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseSubjectInstance?.depth}">
				<li class="fieldcontain">
					<span id="depth-label" class="property-label"><g:message code="courseSubject.depth.label" default="Depth" /></span>
					
						<span class="property-value" aria-labelledby="depth-label"><g:fieldValue bean="${courseSubjectInstance}" field="depth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseSubjectInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="courseSubject.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:link controller="subject" action="show" id="${courseSubjectInstance?.subject?.id}">${courseSubjectInstance?.subject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseSubjectInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseSubjectInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
