package eprospectus

class PublishController {

  def index() { 
    def result = [:]

    println("Publish Controller");
    println(params)
    println("The user searched for ${params.q} ${params['q']}")

    result.courseList = []
    result.courseList.add("Web Architectures");
    result.courseList.add("Big Data");
    result.courseList.add("Artificial Intelligence");

    return result
  }
}
