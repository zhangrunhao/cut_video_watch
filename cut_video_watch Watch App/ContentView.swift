import WatchConnectivity
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("记录时间戳") {
                recordTimestamp()
            }
        }
    }

    func recordTimestamp() {
        let timestamp = Date().timeIntervalSince1970
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(["timestamp": timestamp], replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error)")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
