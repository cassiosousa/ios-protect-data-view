//
//  SceneDelegate.swift
//  ProtectDataInBackground
//
//  Created by Cassio Sousa on 09/05/20.
//  Copyright © 2020 Cassio Sousa. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var protectDataUIView:ProtectDataUIView?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene),
            let windowSecure = window else { return }
        protectDataUIView = ProtectDataUIView(frame: windowSecure.frame)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        guard let protect = protectDataUIView
        else {return}
        
        protect.removeFromSuperview()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        guard
            let viewRoot = window?.rootViewController?.view,
            let viewProtected = protectDataUIView
        else {return}
        
        viewRoot.addSubview(viewProtected)
        viewProtected.view.center = viewRoot.center
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    


}

