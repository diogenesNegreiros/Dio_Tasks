import Foundation

struct Task {
    var id = UUID()
    var date = Date()
    var description = ""
    var category = Category(name: "Work", color: .green)
}
