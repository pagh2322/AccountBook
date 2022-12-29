//
//  AccountViewController.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import UIKit

final class AccountViewController: UIViewController {
	
	private let accountView = AccountView()
	weak var coordinator: AccountCoordinator?
	
	override func loadView() {
		super.loadView()
		self.view = accountView
	}
	
}
