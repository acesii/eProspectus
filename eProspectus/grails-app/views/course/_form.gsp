<%@ page import="eprospectus.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseCode', 'error')} ">
	<label for="courseCode">
		<g:message code="course.courseCode.label" default="Course Code" />
		
	</label>
	<g:textField name="courseCode" value="${courseInstance?.courseCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseName', 'error')} ">
	<label for="courseName">
		<g:message code="course.courseName.label" default="Course Name" />
		
	</label>
	<g:textField name="courseName" value="${courseInstance?.courseName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'subjects', 'error')} ">
	<label for="subjects">
		<g:message code="course.subjects.label" default="Subjects" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.subjects?}" var="s">
    <li><g:link controller="courseSubject" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="courseSubject" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'courseSubject.label', default: 'CourseSubject')])}</g:link>
</li>
</ul>

</div>

