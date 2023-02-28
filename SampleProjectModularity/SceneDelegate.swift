import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        configureWindow()
    }
    
    private func configureWindow() {
        let adController = UIStoryboard(
            name: "Main",
            bundle: .main
        ).instantiateViewController(identifier: "AdViewController") { coder in
            AdViewController(coder: coder, filteredText: nil)
        }
        window?.rootViewController = adController
        window?.makeKeyAndVisible()
    }
}

