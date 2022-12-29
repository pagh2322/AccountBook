//
//  MainViewController.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class MainViewController: UIViewController {
	
	private let mainView = MainView()
	weak var coordinator: MainCoordinator?
	
	override func loadView() {
		super.loadView()
		self.view = mainView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureAccountList()
		configureNavigationBar()
	}
	
}

extension MainViewController {
	private func configureNavigationBar() {
		self.title = "가계부 목록"
		configureNavigationBarItem()
	}
	
	private func configureNavigationBarItem() {
		let addAccountButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addAccountButtonDidTap))
		
		self.navigationItem.rightBarButtonItem = addAccountButton
	}
	
	@objc private func addAccountButtonDidTap() {
		print("printe")
	}
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	private func configureAccountList() {
		mainView.accountList.delegate = self
		mainView.accountList.dataSource = self
	}
	
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int
	) -> Int {
		return Account.dummy.count
	}
	
	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: AccountListCell.identifier,
			for: indexPath) as? AccountListCell
		else { return .init() }
		
		cell.account = Account.dummy[indexPath.row]
		
		return cell
	}
	
	func tableView(
		_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath
	) {
		coordinator?.presentAccountView()
	}
}
