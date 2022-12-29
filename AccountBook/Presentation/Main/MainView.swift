//
//  MainView.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class MainView: UIView {
	
	let accountList: AccountList = {
		let list = AccountList()
		list.translatesAutoresizingMaskIntoConstraints = false
		return list
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension MainView {
	private func layout() {
		self.backgroundColor = .systemGroupedBackground
		
		self.addSubview(accountList)
		
		NSLayoutConstraint.activate([
			accountList.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			accountList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			accountList.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			accountList.leadingAnchor.constraint(equalTo: self.leadingAnchor)])
	}
}
