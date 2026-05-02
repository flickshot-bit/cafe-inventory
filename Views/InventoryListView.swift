import SwiftUI

struct InventoryListView: View {

    @StateObject var vm = InventoryViewModel()

    @State private var name = ""
    @State private var quantity = ""
    @State private var supplier = ""

    @State private var selectedItem: InventoryItem?

    var body: some View {
        VStack {

            Text("Cafe Inventory")
                .font(.largeTitle)
                .padding()

            if let error = vm.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }

            HStack {
                TextField("Item Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Qty", text: $quantity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 80)

                TextField("Supplier", text: $supplier)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Add") {
                    if let qty = Int(quantity) {
                        let item = InventoryItem(
                            name: name,
                            quantity: qty,
                            threshold: 5,
                            supplier: supplier
                        )

                        vm.addItem(item)

                        name = ""
                        quantity = ""
                        supplier = ""
                    } else {
                        vm.errorMessage = "Enter valid quantity"
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()

            if !vm.items.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Smart Insights")
                        .font(.headline)

                    ForEach(vm.generateInsights(), id: \.self) { insight in
                        Text("• \(insight)")
                            .font(.caption)
                    }
                }
                .padding()
            }

            List {
                ForEach(vm.items) { item in
                    HStack {

                        VStack(alignment: .leading, spacing: 4) {

                            Text(item.name)
                                .font(.headline)

                            Text("Qty: \(item.quantity)")

                            Text(item.supplier)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Button("Delete") {
                            vm.deleteItem(item)
                        }
                        .foregroundColor(.red)
                    }
                    .onTapGesture {
                        selectedItem = item
                    }
                }
            }
        }
        .sheet(item: $selectedItem) { item in
            EditItemView(vm: vm, item: item)
        }
    }
}
