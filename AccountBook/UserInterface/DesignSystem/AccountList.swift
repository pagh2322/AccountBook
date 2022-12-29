//
//  AccountList.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class AccountList: UITableView {
	
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		self.backgroundColor = .systemGroupedBackground
		self.separatorStyle = .none
		configureCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension AccountList {
	private func configureCell() {
		self.register(AccountListCell.self, forCellReuseIdentifier: AccountListCell.identifier)
		self.rowHeight = UITableView.automaticDimension
	}
}
