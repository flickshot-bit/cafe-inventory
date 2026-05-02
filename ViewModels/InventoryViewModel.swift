import Foundation
import Combine

class InventoryViewModel: ObservableObject {

    @Published var items: [InventoryItem] = []
    @Published var errorMessage: String? = nil

    private let service = FirebaseService()

    init() {
        fetchItems()
    }

    func addItem(_ item: InventoryItem) {

        guard !item.name.isEmpty else {
            errorMessage = "Item name cannot be empty"
            return
        }

        items.append(item)

        service.addItem(item) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func fetchItems() {
        service.fetchItems { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let items):
                    self?.items = items
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func updateItem(_ item: InventoryItem) {
        service.updateItem(item) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    if let index = self?.items.firstIndex(where: { $0.id == item.id }) {
                        self?.items[index] = item
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func deleteItem(_ item: InventoryItem) {
        service.deleteItem(item) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.items.removeAll { $0.id == item.id }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func generateInsights() -> [String] {
        var insights: [String] = []

        for item in items {
            if item.quantity == 0 {
                insights.append("\(item.name) is out of stock.")
            } else if item.quantity < item.threshold {
                insights.append("\(item.name) is low.")
            } else {
                insights.append("\(item.name) is sufficient.")
            }
        }

        return insights
    }
}
