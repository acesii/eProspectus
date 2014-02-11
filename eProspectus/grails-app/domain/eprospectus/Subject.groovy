package eprospectus

class Subject {

    String subjCode
    String subjName

    Set courses

    static hasMany=[courses:CourseSubject]
    static mappedBy=[courses:'subject']

    static constraints = {
    }
}
