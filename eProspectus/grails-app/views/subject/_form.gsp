<%@ page import="eprospectus.Subject" %>



<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'courses', 'error')} ">
	<label for="courses">
		<g:message code="subject.courses.label" default="Courses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${subjectInstance?.courses?}" var="c">
    <li><g:link controller="courseSubject" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="courseSubject" action="create" params="['subject.id': subjectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'courseSubject.label', default: 'CourseSubject')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'subjCode', 'error')} ">
	<label for="subjCode">
		<g:message code="subject.subjCode.label" default="Subj Code" />
		
	</label>
	<g:textField name="subjCode" value="${subjectInstance?.subjCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'subjName', 'error')} ">
	<label for="subjName">
		<g:message code="subject.subjName.label" default="Subj Name" />
		
	</label>
	<g:textField name="subjName" value="${subjectInstance?.subjName}"/>
</div>

