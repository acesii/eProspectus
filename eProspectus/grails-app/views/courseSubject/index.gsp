
<%@ page import="eprospectus.CourseSubject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseSubject.label', default: 'CourseSubject')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-courseSubject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-courseSubject" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="courseSubject.course.label" default="Course" /></th>
					
						<g:sortableColumn property="depth" title="${message(code: 'courseSubject.depth.label', default: 'Depth')}" />
					
						<th><g:message code="courseSubject.subject.label" default="Subject" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseSubjectInstanceList}" status="i" var="courseSubjectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseSubjectInstance.id}">${fieldValue(bean: courseSubjectInstance, field: "course")}</g:link></td>
					
						<td>${fieldValue(bean: courseSubjectInstance, field: "depth")}</td>
					
						<td>${fieldValue(bean: courseSubjectInstance, field: "subject")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseSubjectInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
