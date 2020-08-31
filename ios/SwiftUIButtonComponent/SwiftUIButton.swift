import SwiftUI
import Foundation

class ButtonProps: ObservableObject {
  @Published var color: UIColor = UIColor.clear
  @Published var count: Int = 0
  @Published var onCountChange: RCTDirectEventBlock = { _ in }
}

struct SwiftUIButton: View {
  @ObservedObject var props = ButtonProps()
  var body: some View {
      VStack {
        Text("Count \(self.props.count)")
          .padding()

        Button(
          action: {
            self.props.onCountChange(["count": self.props.count + 1])
             print("landmark: \(self.props.color)")
        },
          label: {
            Image(systemName: "plus.circle.fill")
              .foregroundColor(.white)
              .padding()
              .background(Color.red)
              .clipShape(Circle())
          })
      }
      .frame(width: 200, height: 200, alignment: .center)
      .background(Color.init(self.props.color))
  }
}
