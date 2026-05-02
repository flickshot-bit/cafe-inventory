import Foundation

struct InventoryItem: Identifiable {
    let id: String
    var name: String
    var quantity: Int
    var threshold: Int
    var supplier: String

    init(id: String = UUID().uuidString,
         name: String,
         quantity: Int,
         threshold: Int,
         supplier: String) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.threshold = threshold
        self.supplier = supplier
    }
}
