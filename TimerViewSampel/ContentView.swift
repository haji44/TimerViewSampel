//
//  ContentView.swift
//  TimerViewSampel
//
//  Created by kitano hajime on 2022/04/02.
//

import SwiftUI

struct ContentView: View {
    @State private var timeInterval: TimeInterval = 0

    private let formatter = TimerFormatter()
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View {
            Text(NSNumber(value: timeInterval), formatter: formatter)
                .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 50, weight: .light)))
                .onReceive(timer) { _ in
                    timeInterval += 0.01
            }
                .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
