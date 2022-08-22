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
//        calendar.appearance.headerTitleColor = .init(.fontColor)
//        calendar.appearance.headerDateFormat = "yyyy-MM"
        calendar.headerHeight = 0
        
        // WEEKDAY
//        calendar.appearance.weekdayFont = UIFont(name: "GangwonEduAll-OTFBold", size: 12)
//        calendar.appearance.weekdayTextColor = .init(.disabled)
        
        // TITLE
//        calendar.appearance.titleFont = UIFont(name: "GangwonEduAll-OTFLight", size: 16)
        
        // TODAY
//        calendar.appearance.titleTodayColor = .init(.fontColor)
//        calendar.appearance.todayColor = .init(.bgColor)
        
        // SELECTION
//        calendar.appearance.selectionColor = .init(.fontColor)
        calendar.appearance.borderRadius = 0.16
        
        // EVENT
//        calendar.appearance.eventDefaultColor = .init(.fontColor)
//        calendar.appearance.eventSelectionColor = .init(.bgColor)
        
//        calendar.select(store.state.selectedDate)
        
        return calendar
    }
    
    func updateUIView(
        _ uiView: FSCalendar,
        context: Context
    ) {
//        if store.state.willRefreshCalendar {
//            uiView.reloadData()
//            store.dispatch(.willRefreshCalendar)
//        }
    }
    
    func makeCoordinator() -> Coordinator {
//        return Coordinator(store)
        return Coordinator()
    }
    
    class Coordinator:
        NSObject,
        FSCalendarDelegate,
        FSCalendarDataSource,
        FSCalendarDelegateAppearance
    {
//        private var store: AppStore
        
//        init(_ store: AppStore) {
//            self.store = store
//        }
        
        // Did Select
        func calendar(
            _ calendar: FSCalendar,
            didSelect date: Date,
            at monthPosition: FSCalendarMonthPosition
        ) {
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
            if date < Date() {
                return "Today"
            }
            return nil
        }
    }
}
