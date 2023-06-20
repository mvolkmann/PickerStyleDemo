import SwiftUI

struct Status: Hashable, Identifiable {
    var id: String { title }
    let title: String
    let color: Color
}

private let statuses = [
    Status(title: "Pending", color: .gray),
    Status(title: "Running", color: .blue),
    Status(title: "Success", color: .green),
    Status(title: "Warning", color: .yellow),
    Status(title: "Error", color: .red)
]

struct ContentView: View {
    @State private var selectedStatus = statuses[0]

    var body: some View {
        VStack {
            Picker("Status", selection: $selectedStatus) {
                ForEach(statuses) { status in
                    Label(status.title, systemImage: "tag")
                        .tint(status.color)
                        .tag(status)
                }
            }
            .pickerStyle(.palette)
            .paletteSelectionEffect(.symbolVariant(.fill))

            Text("Status is \(selectedStatus.title).")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
