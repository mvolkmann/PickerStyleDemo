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
            Menu(selectedStatus.title) {
                // Tapping the menu causes this Picker to appear.
                // Selecting an option highlights it,
                // but the Picker remains rendered.
                // Users must tap outside the Picker to dismiss it.
                // TODO: Is there a way to dismiss it programmatically?
                Picker("Select a status.", selection: $selectedStatus) {
                    ForEach(statuses) { status in
                        // This is not rendering as expected! See
                        // https://developer.apple.com/forums/thread/732208.
                        Label(status.title, systemImage: "tag")
                            .tint(status.color)
                            .tag(status)
                    }
                }
                // When the palette style is used outside of a menu,
                // a segmented picker is rendered.
                // If that is desired, use the segmented style instead.
                .pickerStyle(.palette)
                .paletteSelectionEffect(.symbolVariant(.fill))
                .onChange(of: selectedStatus) {
                    // TODO: Is there something you can do here
                    // TODO: to dismiss the Picker?
                }
            }

            Text("Status is \(selectedStatus.title).")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
