import Vapor

struct Test : Content {
    let text: String
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("hello", "swift") { req in
        return "Hello, Swift"
    }
    
    router.get("test") { req in
        return Test(text: "test")
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    // Instantiate and register our controller
    let slackController = SlackController()
    try router.register(collection: slackController)
}
