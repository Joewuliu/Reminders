import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false

    @State private var page: RemindersPage = RemindersPage(
        title: "Todo List",
        items: [
            Reminder(title: "Class"),
            Reminder(title: "Homework"),
            Reminder(title: "Eat"),
            Reminder(title: "Get lit")
        ],
        color: .yellow
    )

    var body: some View {
        VStack(alignment: .leading) {

            Text(page.title)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(page.color)
                .padding()

            List {
                ForEach($page.items) { $reminder in
                    HStack {
                        Button {
                            reminder.isCompleted.toggle()
                        } label: {
                            Image(systemName: reminder.isCompleted
                                  ? "checkmark.circle.fill"
                                  : "circle")
                                .font(.system(size: 24))
                                .foregroundStyle(page.color)
                        }
                        .buttonStyle(.plain)

                        Text(reminder.title)
                            .font(.title3)
                            .strikethrough(reminder.isCompleted)
                            .foregroundStyle(reminder.isCompleted ? .gray : .primary)
                            .padding(.leading, 10)
                    }                    .padding(.vertical, 10)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
