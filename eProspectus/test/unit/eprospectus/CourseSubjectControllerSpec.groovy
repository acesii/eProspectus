package eprospectus



import grails.test.mixin.*
import spock.lang.*

@TestFor(CourseSubjectController)
@Mock(CourseSubject)
class CourseSubjectControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.courseSubjectInstanceList
            model.courseSubjectInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.courseSubjectInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def courseSubject = new CourseSubject()
            courseSubject.validate()
            controller.save(courseSubject)

        then:"The create view is rendered again with the correct model"
            model.courseSubjectInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            courseSubject = new CourseSubject(params)

            controller.save(courseSubject)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/courseSubject/show/1'
            controller.flash.message != null
            CourseSubject.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def courseSubject = new CourseSubject(params)
            controller.show(courseSubject)

        then:"A model is populated containing the domain instance"
            model.courseSubjectInstance == courseSubject
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def courseSubject = new CourseSubject(params)
            controller.edit(courseSubject)

        then:"A model is populated containing the domain instance"
            model.courseSubjectInstance == courseSubject
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/courseSubject/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def courseSubject = new CourseSubject()
            courseSubject.validate()
            controller.update(courseSubject)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.courseSubjectInstance == courseSubject

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            courseSubject = new CourseSubject(params).save(flush: true)
            controller.update(courseSubject)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/courseSubject/show/$courseSubject.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/courseSubject/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def courseSubject = new CourseSubject(params).save(flush: true)

        then:"It exists"
            CourseSubject.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(courseSubject)

        then:"The instance is deleted"
            CourseSubject.count() == 0
            response.redirectedUrl == '/courseSubject/index'
            flash.message != null
    }
}
