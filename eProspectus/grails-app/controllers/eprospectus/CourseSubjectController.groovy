package eprospectus



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CourseSubjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseSubject.list(params), model:[courseSubjectInstanceCount: CourseSubject.count()]
    }

    def show(CourseSubject courseSubjectInstance) {
        respond courseSubjectInstance
    }

    def create() {
        respond new CourseSubject(params)
    }

    @Transactional
    def save(CourseSubject courseSubjectInstance) {
        if (courseSubjectInstance == null) {
            notFound()
            return
        }

        if (courseSubjectInstance.hasErrors()) {
            respond courseSubjectInstance.errors, view:'create'
            return
        }

        courseSubjectInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseSubjectInstance.label', default: 'CourseSubject'), courseSubjectInstance.id])
                redirect courseSubjectInstance
            }
            '*' { respond courseSubjectInstance, [status: CREATED] }
        }
    }

    def edit(CourseSubject courseSubjectInstance) {
        respond courseSubjectInstance
    }

    @Transactional
    def update(CourseSubject courseSubjectInstance) {
        if (courseSubjectInstance == null) {
            notFound()
            return
        }

        if (courseSubjectInstance.hasErrors()) {
            respond courseSubjectInstance.errors, view:'edit'
            return
        }

        courseSubjectInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseSubject.label', default: 'CourseSubject'), courseSubjectInstance.id])
                redirect courseSubjectInstance
            }
            '*'{ respond courseSubjectInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseSubject courseSubjectInstance) {

        if (courseSubjectInstance == null) {
            notFound()
            return
        }

        courseSubjectInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseSubject.label', default: 'CourseSubject'), courseSubjectInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseSubjectInstance.label', default: 'CourseSubject'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
