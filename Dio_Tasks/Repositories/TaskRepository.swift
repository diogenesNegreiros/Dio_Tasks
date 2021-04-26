import Foundation

class TaskRepository {
    
    static let instance = TaskRepository()
    let tasks: [Task]
    
    init() {
        self.tasks = []
    }
}
