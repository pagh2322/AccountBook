//
//  MainCoordinator.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class MainCoordinator: Coordinator {
	
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewController = MainViewController()
		viewController.coordinator = self
		navigationController.setViewControllers([viewController], animated: false)
	}
	
	func presentAccountView() {
		let coordinator = AccountCoordinator(navigationController: navigationController)
		coordinator.parentCoordinator = self
		coordinator.start()
		childCoordinators.append(coordinator)
	}
	
}
