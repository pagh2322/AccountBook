//
//  SummaryNumber.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import UIKit

final class SummaryNumber: UIView {
	
	let numberLabel: UILabel = {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .title1)
		label.textColor = .label
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private let indicator: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 4
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let indicatorLabel: UILabel = {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .callout)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var indicatorWidthAnchor = indicator.widthAnchor.constraint(equalToConstant: indicatorLength)
	var indicatorLength: CGFloat {
		didSet {
			NSLayoutConstraint.deactivate([indicatorWidthAnchor])
			NSLayoutConstraint.activate([indicatorWidthAnchor])
		}
	}
	
	var isIncome: Bool {
		didSet {
			indicator.backgroundColor = isIncome ? .cBlue : .cRed
			indicatorLabel.text = isIncome ? "수입" : "지출"
		}
	}
	
	override init(frame: CGRect) {
		indicatorLength = UIScreen.main.bounds.width - 24
		isIncome = true
		super.init(frame: frame)
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension SummaryNumber {
	private func layout() {
		indicator.addSubview(indicatorLabel)
		
		NSLayoutConstraint.activate([
			indicatorLabel.centerYAnchor.constraint(equalTo: indicator.centerYAnchor),
			indicatorLabel.leadingAnchor.constraint(equalTo: indicator.leadingAnchor, constant: 4)])
		
		[numberLabel, indicator].forEach { self.addSubview($0) }
		
		NSLayoutConstraint.activate([
			numberLabel.topAnchor.constraint(equalTo: self.topAnchor),
			numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
			numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)])
		
		NSLayoutConstraint.activate([
			indicator.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 4),
			indicator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			indicator.leadingAnchor.constraint(equalTo: numberLabel.leadingAnchor),
			indicator.heightAnchor.constraint(equalToConstant: 20)])
	}
}
