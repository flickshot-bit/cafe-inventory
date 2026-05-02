import SwiftUI

struct EditItemView: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: InventoryViewModel

    @State var item: InventoryItem

    var body: some View {
        VStack(spacing: 16) {

            Text("Edit Item")
                .font(.title)

            TextField("Name", text: $item.name)
                .textFieldStyle(.roundedBorder)

            TextField("Quantity", value: $item.quantity, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)

            TextField("Supplier", text: $item.supplier)
                .textFieldStyle(.roundedBorder)

            Button("Save") {
                vm.updateItem(item)
                dismiss()
            }
            .buttonStyle(.borderedProminent)

            Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.red)
        }
        .padding()
    }
}
