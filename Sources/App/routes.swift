import Routing
import Vapor

public func routes(_ router: Router) throws {

    // return a String
    router.get("name") { req in
        return "Ethan Hunt"
    }

    // return an Int
    router.get("age") { req in
        return 23
    }

    // return JSON
    router.get("json") { req in
        return Person(name: "Martin J. Lasek", age: 26)
    }
}

// note: structs or classes
// must conform to Content to be able to encode to json
struct Person: Content {
    var name: String
    var age: Int
}
