import UIKit
import WatchConnectivity

class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        return true
    }

    // 实现WCSessionDelegate的方法
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // 在这里处理session的激活完成
        print("sesson 激活")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let timestamp = message["timestamp"] as? TimeInterval {
            // 在这里处理收到的时间戳
            print("Received timestamp: \(timestamp)")
        }
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        // 当session变为非激活状态时会调用
    }

    func sessionDidDeactivate(_ session: WCSession) {
        // 当session需要重新激活时会调用，你需要在这里调用session.activate()
        session.activate()
    }
}
