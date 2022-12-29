//
//  Coordinator.swift
//  AccountBook
//
//  Created by peo on 2022/12/27.
//

import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
