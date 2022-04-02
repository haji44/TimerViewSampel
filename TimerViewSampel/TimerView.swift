//
//  TimerView.swift
//  TimerViewSampel
//
//  Created by kitano hajime on 2022/04/02.
//

import SwiftUI

struct ElapesdTimeView: View {
    var elapedTime: TimeInterval = 600
    @State private var timeFormatter = TimerFormatter()

    var body: some View {
        Text(NSNumber(value: elapedTime), formatter: timeFormatter)
            .fontWeight(.semibold)
    }
}

class ElapesedTImeFormatter: Formatter {
    let componentFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second, .nanosecond]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    var showSubseconds = true

    override func string(for obj: Any?) -> String? {

        guard let time = obj as? TimeInterval else { return nil }

        guard let formattedString = componentFormatter.string(from: time) else {
            return nil
        }
//
//        if showSubseconds {
            let hunredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
            let decimalSperator = Locale.current.decimalSeparator ?? "."
            return String(format: "%@%@%0.2d", formattedString, decimalSperator, hunredths)
//        }
//        return formattedString
    }

}
