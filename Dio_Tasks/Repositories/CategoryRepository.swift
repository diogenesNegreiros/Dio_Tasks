import Foundation

class CategoryRepository {
    
    static func getCategories() -> [Category] {
        let categories = [
            Category( name: "Work", color: .green),
            Category( name: "Study", color: .blue),
            Category( name: "To Dos", color: .yellow),
            Category( name: "Reminders", color: .red),
            Category( name: "Home", color: .purple),
        ]
        return categories
    }
}
