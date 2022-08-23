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
        calendar.appearance.subtitleDefaultColor = .label
        
        // TODAY
        calendar.appearance.titleTodayColor = .label
        calendar.appearance.todayColor = .systemGroupedBackground
        calendar.appearance.subtitleTodayColor = .label
        
        // SELECTION
//        calendar.appearance.selectionColor = .init(.fontColor)
        calendar.appearance.borderRadius = 0.16
        
        // EVENT
//        calendar.appearance.eventDefaultColor = .init(.fontColor)
        calendar.appearance.eventSelectionColor = .init(.cBlue)
        
        calendar.select(Date())
        
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
//        if store.state.willRefreshCalendar {
//            uiView.reloadData()
//            store.dispatch(.willRefreshCalendar)
//        }
    }
    
    func makeCoordinator() -> Coordinator {
//        return Coordinator(store)
        return Coordinator(appState)
    }
    
    class Coordinator:
        NSObject,
        FSCalendarDelegate,
        FSCalendarDataSource,
        FSCalendarDelegateAppearance
    {
//        private var store: AppStore
        private var appState: AppState
        
        init(_ appState: AppState) {
            self.appState = appState
        }
//        init(_ store: AppStore) {
//            self.store = store
//        }
        
        // Did Select
        func calendar(
            _ calendar: FSCalendar,
            didSelect date: Date,
            at monthPosition: FSCalendarMonthPosition
        ) {
            appState.currentDate = date
//            store.dispatch(.didTapDate(date))
        }
        
        func calendar(
            _ calendar: FSCalendar,
            numberOfEventsFor date: Date
        ) -> Int {
//            for diary in store.state.diaries {
//                if diary.date == date {
//                    return 1
//                }
//            }
            return 0
        }
        
        func calendar(
            _ calendar: FSCalendar,
            appearance: FSCalendarAppearance,
            eventDefaultColorsFor date: Date
        ) -> [UIColor]? {
//            for diary in store.state.diaries {
//                if diary.date == date {
//                    return [.init(DiaryManager.shared.fetchMotionColor(diary))]
//                }
//            }
            return nil
        }
        
        func calendar(
            _ calendar: FSCalendar,
            appearance: FSCalendarAppearance,
            fillSelectionColorFor date: Date
        ) -> UIColor? {
//            for diary in store.state.diaries {
//                if diary.date == date {
//                    return .init(DiaryManager.shared.fetchMotionColor(diary))
//                }
//            }
            return appearance.selectionColor
        }
        
        func calendar(
            _ calendar: FSCalendar,
            subtitleFor date: Date
        ) -> String? {
            var price: Double = 0
            for historyModel in appState.monthlyHistoryModels {
                if Calendar.current.isDate(historyModel.date, inSameDayAs: date) {
                    price += historyModel.price
                }
            }
            if price != 0 {
                return PriceManager.string(price: price) + "원"
            } else {
                return nil
            }
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            appState.currentDate = calendar.currentPage
//            appState.monthlyHistoryModels = [] // Assign related values
            calendar.select(calendar.currentPage)
        }
    }
}
