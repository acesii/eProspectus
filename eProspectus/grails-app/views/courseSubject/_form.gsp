<%@ page import="eprospectus.CourseSubject" %>



<div class="fieldcontain ${hasErrors(bean: courseSubjectInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="courseSubject.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${eprospectus.Course.list()}" optionKey="id" required="" value="${courseSubjectInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseSubjectInstance, field: 'depth', 'error')} ">
	<label for="depth">
		<g:message code="courseSubject.depth.label" default="Depth" />
		
	</label>
	<g:textField name="depth" value="${courseSubjectInstance?.depth}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseSubjectInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="courseSubject.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subject" name="subject.id" from="${eprospectus.Subject.list()}" optionKey="id" required="" value="${courseSubjectInstance?.subject?.id}" class="many-to-one"/>
</div>

