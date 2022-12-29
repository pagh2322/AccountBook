//
//  SceneDelegate.swift
//  AccountBook
//
//  Created by peo on 2022/12/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	var mainCoordinator: MainCoordinator?
	
	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		let navigationController = UINavigationController()
		mainCoordinator = MainCoordinator(navigationController: navigationController)
		mainCoordinator?.start()
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
	
}
