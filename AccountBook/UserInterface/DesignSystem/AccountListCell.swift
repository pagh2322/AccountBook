//
//  AccountListCell.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class AccountListCell: UITableViewCell {
	
	static let identifier = "AccountListCell"
	
	private let container: UIView = {
		let view = UIView()
		view.backgroundColor = .secondarySystemGroupedBackground
		view.layer.cornerRadius = 8
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private let chevronRight: UIImageView = {
		let imageView = UIImageView(image: UIImage(systemName: "chevron.forward"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private let divider: UIView = {
		let view = UIView()
		view.backgroundColor = .secondaryLabel
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let income: SummaryNumber = {
		let view = SummaryNumber()
		view.isIncome = true
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let excome: SummaryNumber = {
		let view = SummaryNumber()
		view.isIncome = false
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var account: Account? {
		didSet {
			guard let account else { return }
			nameLabel.text = account.name
			income.numberLabel.text = "\(account.income)"
			excome.numberLabel.text = "\(account.excome)"
			
			var widthPerNumber: CGFloat = 0
			if account.income == 0 && account.excome == 0 {
				widthPerNumber = 36
			} else {
				widthPerNumber = (UIScreen.main.bounds.width - 72) / max(account.income, account.excome)
			}
			income.indicatorLength = account.income == 0 ? 36 : widthPerNumber * account.income
			excome.indicatorLength = account.excome == 0 ? 36 : widthPerNumber * account.excome
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension AccountListCell {
	private func layout() {
		self.selectionStyle = .none
		self.backgroundColor = .systemGroupedBackground
		
		[nameLabel,
		 chevronRight,
		 divider,
		 income,
		 excome]
			.forEach { self.container.addSubview($0) }
		
		self.contentView.addSubview(container)
		
		let containerConstraints = [
			container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
			container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
			container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
			container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)]
		
		let nameLabelConstraints = [
			nameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
			nameLabel.trailingAnchor.constraint(equalTo: chevronRight.leadingAnchor, constant: 16),
			nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16)]
		
		let chevronRightConstraints = [
			chevronRight.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
			chevronRight.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16)]
		
		let dividerConstraints = [
			divider.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
			divider.trailingAnchor.constraint(equalTo: chevronRight.trailingAnchor),
			divider.bottomAnchor.constraint(equalTo: excome.topAnchor, constant: -8),
			divider.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			divider.heightAnchor.constraint(equalToConstant: 0.4)]
		
		let excomeConstraints = [
			excome.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			excome.leadingAnchor.constraint(equalTo: container.leadingAnchor)]
		
		let incomeConstraints = [
			income.topAnchor.constraint(equalTo: excome.bottomAnchor, constant: 4),
			income.trailingAnchor.constraint(equalTo: container.trailingAnchor),
			income.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
			income.leadingAnchor.constraint(equalTo: container.leadingAnchor)]
		
		[containerConstraints,
		 nameLabelConstraints,
		 chevronRightConstraints,
		 dividerConstraints,
		 excomeConstraints,
		 incomeConstraints].forEach { NSLayoutConstraint.activate($0) }
	}
}
