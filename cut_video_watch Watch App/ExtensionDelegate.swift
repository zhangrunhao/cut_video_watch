import WatchConnectivity
import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {
    func applicationDidFinishLaunching() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // 这里可以进行激活完成时的处理
        print("这里可以进行激活完成时的处理")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // 处理来自iPhone的消息
        print("处理来自iPhone的消息")
    }

    // 实现其他WCSessionDelegate协议方法...
}
