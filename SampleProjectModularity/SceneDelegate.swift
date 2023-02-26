import UIKit
import ComposableArchitecture

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        configureWindow()
    }
    
    private func configureWindow() {
        let store = Store(
            initialState: AdFeature.State(
                searchParameters: SearchParametersModel()),
            reducer: AdFeature()
        )
        let adController = UIStoryboard(
            name: "Main",
            bundle: .main
        ).instantiateViewController(identifier: "AdViewController") { coder in
            AdViewController(coder: coder, viewStore: ViewStore(store))
        }
        window?.rootViewController = adController
        window?.makeKeyAndVisible()
    }
}

