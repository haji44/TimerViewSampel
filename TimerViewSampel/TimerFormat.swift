//
//  TimerFormat.swift
//  TimerViewSampel
//
//  Created by kitano hajime on 2022/04/02.
//

import Foundation

class TimerFormatter: Formatter {
    let componentFormatter: DateComponentsFormatter = {
//        let formatter = DateComponentsFormatter()
//        formatter.unitsStyle = .positional
//        formatter.allowedUnits = [.minute, .second] // .hour, ,, .nanosecond
//        formatter.zeroFormattingBehavior = .pad
//        return formatter
        let formatter = DateComponentsFormatter()
//        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    override func string(for obj: Any?) -> String? {
        guard let time = obj as? TimeInterval else { return nil }

        guard let formattedString = componentFormatter.string(from: time)  else {
            return nil
        }
        let hunredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        let decimalSperator = Locale.current.decimalSeparator ?? "."
        return String(format: "%@%@%0.2d", formattedString, decimalSperator, hunredths)
    }

}
