//
//  FSCalendarView.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import SwiftUI
import FSCalendar

struct FSCalendarView: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    
    var scope: FSCalendarScope = .month
    
    @Binding var showDetailModal: Bool
    
    @EnvironmentObject var appState: AppState
//    @EnvironmentObject var store: AppStore
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.scope = self.scope
        
        // HEADER
        calendar.locale = Locale(identifier: "en_US")
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
//        calendar.appearance.headerTitleFont = UIFont(name: "GangwonEduAll-OTFLight", size: 20)
        calendar.headerHeight = 0
        
        // WEEKDAY
        calendar.appearance.weekdayFont = .preferredFont(forTextStyle: .headline)
//        calendar.appearance.weekdayFont = UIFont(name: "GangwonEduAll-OTFBold", size: 12)
        calendar.appearance.weekdayTextColor = .init(.secondary)
        
        // TITLE
        calendar.appearance.titleFont = .preferredFont(forTextStyle: .subheadline)
//        calendar.appearance.titleFont = UIFont(name: "GangwonEduAll-OTFLight", size: 16)
        calendar.appearance.titleDefaultColor = .init(.cBlack)
        calendar.appearance.subtitleDefaultColor = .init(.cRed)
        calendar.placeholderType = .none
        
        // TODAY
        calendar.appearance.titleTodayColor = .init(.cBlue)
        calendar.appearance.todayColor = .clear
        calendar.appearance.subtitleTodayColor = .init(.cRed)
        
        // SELECTION
//        calendar.appearance.selectionColor = .init(.fontColor)
//        calendar.appearance.borderRadius = 0.16
        calendar.appearance.titleTodayColor = .init(.cBlue)
        calendar.appearance.titleSelectionColor = .init(.cBlack)
        calendar.appearance.selectionColor = .clear
        calendar.appearance.subtitleSelectionColor = .init(.cRed)
        
        // EVENT
//        calendar.appearance.eventDefaultColor = .init(.fontColor)
//        calendar.appearance.eventSelectionColor = .init(.cBlue)
        
//        calendar.select(Date())
        
        calendar.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        return calendar
    }
    
    func updateUIView(
        _ uiView: FSCalendar,
        context: Context
    ) {
        appState.refreshCalendar
            .sink { _ in
                uiView.reloadData()
            }
            .store(in: &appState.cancellables)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(appState, showDetailModal: $showDetailModal)
    }
    
    class Coordinator:
        FSCalendarAppearance,
        FSCalendarDelegate,
        FSCalendarDataSource,
        FSCalendarDelegateAppearance
    {
        private var appState: AppState
        @Binding var showDetailModal: Bool
        
        init(_ appState: AppState, showDetailModal: Binding<Bool>) {
            self.appState = appState
            self._showDetailModal = showDetailModal
        }
        
        func calendar(
            _ calendar: FSCalendar,
            didSelect date: Date,
            at monthPosition: FSCalendarMonthPosition
        ) {
            if calendar.today == date {
                calendar.appearance.titleSelectionColor = .init(.cBlue)
            } else {
                calendar.appearance.titleSelectionColor = .init(.cBlack)
            }
            appState.currentDate = date
            showDetailModal.toggle()
        }
        
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleOffsetFor date: Date) -> CGPoint {
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
            let price = HistoryService.fetchDailyPrice(date: date, type: .expenditure)
            if price != 0 {
                return PriceManager.string(price: price)
            } else {
                return ""
            }
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            appState.currentDate = calendar.currentPage
            appState.changeCalendarCurrentPage.send(calendar.currentPage)
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
            let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
            return cell as! CustomCell
        }

        private func configure(
            cell: FSCalendarCell,
            for date: Date,
            at position: FSCalendarMonthPosition
        ) {
            let diyCell = (cell as! CustomCell)
            
            let price = HistoryService.fetchDailyPrice(date: date, type: .income)
            if price != 0 {
                diyCell.lbSecondaRiga.text = PriceManager.string(price: price)
            } else {
                diyCell.lbSecondaRiga.text = ""
            }
        }
    }

    final class CustomCell: FSCalendarCell {
        var lbSecondaRiga: UILabel = UILabel()

        required init!(coder aDecoder: NSCoder!) {
            fatalError("init(coder:) has not been implemented")
        }

        override init(frame: CGRect) {
            super.init(frame: frame)

            let lbSecondaRiga = UILabel(frame: CGRect(x: 0, y: 15, width: 20, height: 10))
            lbSecondaRiga.lineBreakMode = .byWordWrapping
            lbSecondaRiga.textColor = .init(.cBlue)
            lbSecondaRiga.text = ""
            self.lbSecondaRiga = lbSecondaRiga


            let view = UIView(frame: self.bounds)
            view.insertSubview(self.lbSecondaRiga, belowSubview: self.subtitleLabel)
            self.backgroundView = view
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.subtitleLabel.textAlignment = .right
//            self.layer.borderWidth = 0.4
//            self.layer.borderColor = UIColor(.cBlack.opacity(0.4)).cgColor

            self.lbSecondaRiga.frame = self.subtitleLabel.frame
            self.lbSecondaRiga.font = self.subtitleLabel.font
            self.lbSecondaRiga.textAlignment = self.subtitleLabel.textAlignment
            self.lbSecondaRiga.lineBreakMode = self.subtitleLabel.lineBreakMode
            self.lbSecondaRiga.textColor = .init(.cBlue)

            self.lbSecondaRiga.frame.origin.y += 12
        }
     }
}

