//
//  Baekjoon2884.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon2884 {
    func run() {
        solution()
    }
    
    func solution() {
        let times = readLine()!.split(separator: " ").map { Int($0)! }
        var hours = times[0]
        var minutes = times[1]
        
        minutes -= 45
        
        if minutes < 0 {
            hours -= 1
            minutes += 60
        }
        
        if hours < 0 {
            hours += 24
        }
        print("\(hours) \(minutes)")
    }
}
