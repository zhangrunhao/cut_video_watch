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
        let message = ["timestamp": timestamp]
        
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(message, replyHandler: { reply in
                // 在收到手机的回复时执行的操作
                print("手机回复：", reply)
            }, errorHandler: { error in
                // 发送消息失败时的处理
                print("发送失败：", error)
            })
        } else {
            print("手机不可达")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
