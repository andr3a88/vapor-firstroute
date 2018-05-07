import Routing
import Vapor
import Leaf

public func routes(_ router: Router) throws {

    // return a String
    router.get("name") { req in
        return "Andrea"
    }

    // return an Int
    router.get("age") { req in
        return 23
    }

    // return JSON
    router.get("json") { req in
        return Person(name: "Martin J. Lasek", age: 26)
    }

    router.get("view") { req -> Future<View> in
        return try req.view().render("welcome")
    }

    router.get("bonus") { req -> Future<View> in
        let data = ["name": "Andrea", "age": "18"]
        return try req.view().render("whoami", data)
    }
}

// note: structs or classes
// must conform to Content to be able to encode to json
struct Person: Content {
    var name: String
    var age: Int
}
