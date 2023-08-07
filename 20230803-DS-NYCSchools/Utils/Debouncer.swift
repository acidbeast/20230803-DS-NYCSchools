//
//  Debouncer.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import Foundation

class Debouncer {
    
    let delay: Double
    var timer: Timer?

    init(delay: Double) {
        self.delay = delay
    }

    func debounce(task: @escaping (() -> Void)) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            task()
        }
    }
    
}
