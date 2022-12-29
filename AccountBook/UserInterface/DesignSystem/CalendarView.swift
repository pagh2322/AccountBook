//
//  CalendarView.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import UIKit
import FSCalendar

final class CalendarView: FSCalendar {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		layout()
		configureCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension CalendarView {
	private func configure() {
		self.scope = .month
		self.locale = Locale(identifier: "en_US")
	}
}

extension CalendarView {
	private func layout() {
		self.backgroundColor = .systemBackground
		configureHeader()
		configureWeekDay()
		configureTitle()
		configureToday()
		configureSelection()
	}
}

// MARK: - Configure Appearance

extension CalendarView {
	private func configureHeader() {
		self.appearance.headerMinimumDissolvedAlpha = 0.0
		self.headerHeight = 0
	}
	
	private func configureWeekDay() {
		self.appearance.weekdayFont = .preferredFont(forTextStyle: .headline)
		self.appearance.weekdayTextColor = .secondaryLabel
	}
	
	private func configureTitle() {
		self.appearance.titleFont = .preferredFont(forTextStyle: .subheadline)
		self.appearance.titleDefaultColor = .cBlack
		self.appearance.subtitleDefaultColor = .cRed
		self.placeholderType = .none
	}
	
	private func configureToday() {
		self.appearance.titleTodayColor = .cBlue
		self.appearance.todayColor = .clear
		self.appearance.subtitleTodayColor = .cRed
	}
	
	private func configureSelection() {
		self.appearance.titleTodayColor = .cBlue
		self.appearance.titleSelectionColor = .cBlack
		self.appearance.selectionColor = .clear
		self.appearance.subtitleSelectionColor = .cRed
	}
}

// MARK: - Configure Cell

extension CalendarView {
	private func configureCell() {
		self.register(CalendarCell.self, forCellReuseIdentifier: CalendarCell.identifier)
	}
}

final class CalendarViewController: UIViewController {
	
	private let calendar = CalendarView()
	
	override func loadView() {
		super.loadView()
		self.view = calendar
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}
	
}

extension CalendarViewController:
//	FSCalendarAppearance,
	FSCalendarDelegate,
	FSCalendarDataSource,
	FSCalendarDelegateAppearance
{
	private func configure() {
		calendar.delegate = self
		calendar.dataSource = self
	}
	
	func calendar(
		_ calendar: FSCalendar,
		didSelect date: Date,
		at monthPosition: FSCalendarMonthPosition
	) {
		if calendar.today == date {
			calendar.appearance.titleSelectionColor = .cBlue
		} else {
			calendar.appearance.titleSelectionColor = .cBlack
		}
	}
	
	func calendar(
		_ calendar: FSCalendar,
		appearance: FSCalendarAppearance,
		titleOffsetFor date: Date
	) -> CGPoint {
		return .init(x: 0, y: -4)
	}
	
	func calendar(
		_ calendar: FSCalendar,
		numberOfEventsFor date: Date
	) -> Int {
		return 0
	}
	
	func calendar(
		_ calendar: FSCalendar,
		appearance: FSCalendarAppearance,
		eventDefaultColorsFor date: Date
	) -> [UIColor]? {
		return nil
	}
	
	func calendar(
		_ calendar: FSCalendar,
		subtitleFor date: Date
	) -> String? {
//		let price = HistoryService.fetchDailyPrice(date: date, type: .expenditure)
//		if price != 0 {
//			return PriceManager.string(price: price)
//		} else {
//			return ""
//		}
		return "-7"
	}
	
	func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
		calendar.select(calendar.currentPage)
	}
	
	func calendar(
		_ calendar: FSCalendar,
		appearance: FSCalendarAppearance,
		subtitleOffsetFor date: Date
	) -> CGPoint {
		return .init(x: 0, y: 0)
	}
	
	func calendar(
		_ calendar: FSCalendar,
		willDisplay cell: FSCalendarCell,
		for date: Date,
		at monthPosition: FSCalendarMonthPosition
	) {
		configure(cell: cell, for: date, at: monthPosition)
	}
	
	func calendar(
		_ calendar: FSCalendar,
		cellFor date: Date,
		at position: FSCalendarMonthPosition
	) -> FSCalendarCell {
		guard let cell = calendar.dequeueReusableCell(
			withIdentifier: CalendarCell.identifier,
			for: date,
			at: position) as? CalendarCell
		else { return .init() }
		return cell
	}
	
	private func configure(
		cell: FSCalendarCell,
		for date: Date,
		at position: FSCalendarMonthPosition
	) {
		guard let calendarCell = cell as? CalendarCell else { return }
		cell.subtitleLabel.text = "-7,600"
		calendarCell.secondLabel.text = "+7,222"
		
//		let price = HistoryService.fetchDailyPrice(date: date, type: .income)
//		if price != 0 {
//			diyCell.lbSecondaRiga.text = PriceManager.string(price: price)
//		} else {
//			diyCell.lbSecondaRiga.text = ""
//		}
	}
}

final class CalendarCell: FSCalendarCell {
	
	static let identifier = "CalendarCell"
	
	let secondLabel: UILabel = {
		let label = UILabel()
		label.textColor = .cBlue
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureView()
	}
	
	required init!(coder aDecoder: NSCoder!) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		configureSecondLabel()
	}
	
	private func configureView() {
		let view = UIView(frame: self.bounds)
		view.insertSubview(secondLabel, belowSubview: self.subtitleLabel)
		self.backgroundView = view
	}
	
	private func configureSecondLabel() {
		secondLabel.font = self.subtitleLabel.font
		secondLabel.frame = self.subtitleLabel.frame
		secondLabel.frame.origin.y += 12
	}
	
}
