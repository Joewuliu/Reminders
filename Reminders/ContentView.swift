import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false

    @State private var page: RemindersPage = RemindersPage(
        title: "Todo List",
        items: [
            Reminder(title: "Get groceries"),
            Reminder(title: "Complete compilers lab"),
            Reminder(title: "Finish Cupboard ticket"),
            Reminder(title: "Feed Sugar Pig")
        ],
        color: .yellow
    )

    var body: some View {
        VStack {
            Text(page.title)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(page.color)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
