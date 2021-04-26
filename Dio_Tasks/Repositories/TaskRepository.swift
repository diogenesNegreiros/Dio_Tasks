// MARK: Padrão Singleton
import Foundation

class TaskRepository {
    
    static let instance = TaskRepository()
    private var tasks: [Task]
    
    private init() {
        self.tasks = []
    }
    
    func save(task: Task) {
        self.tasks.append(task)
    }
    
    func update(taskToUpdate: Task) {
        let taskIndex = tasks.firstIndex {(task) -> Bool in
            task.id == taskToUpdate.id
        }
        tasks.remove(at: taskIndex!)
        tasks.append(taskToUpdate)
    }
    
    func getTasks() -> [Task] {
        self.tasks
    }
}
