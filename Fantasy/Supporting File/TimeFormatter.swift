//
//  File.swift
//  Fantasy
//
//  Created by mac on 21/05/22.
//

import Foundation

struct TimeFormatter {

    static func secondsInDays(_ seconds: TimeInterval) -> Int {
        return secondsInHours(seconds) / 24
    }

    static func secondsInHours(_ seconds: TimeInterval) -> Int {
        return secondsInMinutes(seconds) / 60
    }

    static func secondsInMinutes(_ seconds: TimeInterval) -> Int {
        return Int(seconds) / 60
    }

    static func secondsInSeconds(_ seconds: TimeInterval) -> Int {
        return Int(seconds) % 60
    }

    static func calculateTime(_ dateCreated: Date, fireDate: Date) -> String {
        let countdownTime = fireDate.timeIntervalSince(dateCreated)
        let days = secondsInDays(countdownTime)
        let hours = secondsInHours(countdownTime) - secondsInDays(countdownTime) * 24
        let minutes = secondsInMinutes(countdownTime) - secondsInHours(countdownTime) * 60
        let seconds = secondsInSeconds(countdownTime)
        var lastString = ""

        if days == 0 {
            lastString = "\(hours):\(minutes):\(seconds) Sec"
        } else if days == 1 {
            lastString = "\(days) Day left"
        } else if days < 4 {
            lastString = "\(days) Day's left"
        } else if days > 3 {
            lastString = getString(date: fireDate)
        }
        return lastString
    }
}
