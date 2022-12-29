//
//  AccountCoordinator.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class AccountCoordinator: Coordinator {
	
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	weak var parentCoordinator: Coordinator?
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewController = AccountViewController()
		viewController.coordinator = self
		navigationController.pushViewController(viewController, animated: true)
	}
	
}
