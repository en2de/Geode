//
//  AsycnTesting.swift
//  Geode
//
//  Created by envy.chen on 30/09/2016.
//  Copyright © 2016 en2de.github.io. All rights reserved.
//

import Foundation

protocol AsycnTesting {
    func asyncTest(timeout: TimeInterval, testCase: (@escaping () -> Void) -> Void , onTimeout: (() -> Void)?)
}

extension AsycnTesting {
    func asyncTest(timeout: TimeInterval = 15, testCase: (@escaping () -> Void) -> Void, onTimeout: (() -> Void)? = nil) {
        let timeoutDate = Date(timeIntervalSinceNow: timeout)
        var testCompleted = false
        testCase {
            testCompleted = true
        }
        
        while testCompleted == false, timeoutDate.timeIntervalSinceNow > 0 {
            CFRunLoopRunInMode(.defaultMode, 0.01, true)
        }
        
        if testCompleted == false {
            onTimeout?()
        }
    }
}
