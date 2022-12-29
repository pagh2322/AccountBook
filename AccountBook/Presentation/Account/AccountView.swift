//
//  AccountView.swift
//  AccountBook
//
//  Created by peo on 2022/12/27.
//

import UIKit

final class AccountView: UIView {
	
	private let calendarViewController = CalendarViewController()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - Layout

extension AccountView {
	private func layout() {
		self.backgroundColor = .systemBackground
		
		calendarViewController.view.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(calendarViewController.view)
		
		NSLayoutConstraint.activate([
			calendarViewController.view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			calendarViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
			calendarViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
			calendarViewController.view.heightAnchor.constraint(equalToConstant: 320)])
	}
}
