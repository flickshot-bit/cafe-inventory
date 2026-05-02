import FirebaseFirestore

final class FirebaseService {

    private let db = Firestore.firestore()
    private let collection = "items"

    func addItem(_ item: InventoryItem, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection)
            .document(item.id)
            .setData([
                "id": item.id,
                "name": item.name,
                "quantity": item.quantity,
                "threshold": item.threshold,
                "supplier": item.supplier
            ]) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
    }

    func updateItem(_ item: InventoryItem, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection)
            .document(item.id)
            .setData([
                "id": item.id,
                "name": item.name,
                "quantity": item.quantity,
                "threshold": item.threshold,
                "supplier": item.supplier
            ], merge: true) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
    }

    func fetchItems(completion: @escaping (Result<[InventoryItem], Error>) -> Void) {
        db.collection(collection)
            .getDocuments { snapshot, error in

                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let documents = snapshot?.documents else {
                    completion(.success([]))
                    return
                }

                let items = documents.map { doc -> InventoryItem in
                    let data = doc.data()

                    return InventoryItem(
                        id: data["id"] as? String ?? UUID().uuidString,
                        name: data["name"] as? String ?? "",
                        quantity: data["quantity"] as? Int ?? 0,
                        threshold: data["threshold"] as? Int ?? 0,
                        supplier: data["supplier"] as? String ?? ""
                    )
                }

                completion(.success(items))
            }
    }

    func deleteItem(_ item: InventoryItem, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection)
            .document(item.id)
            .delete { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
    }
}
