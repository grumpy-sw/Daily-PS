//
//  Baekjoon2525.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon2525 {
    func run() {
        solution()
    }
    
    func solution() {
        let times = readLine()!.split(separator: " ").map { Int($0)! }
        let duration = Int(readLine()!)!
        var hours = times[0]
        var minutes = (times[1] + duration)
        
        minutes += hours * 60
        hours = minutes / 60
        minutes = minutes % 60
        
        if hours >= 24 {
            hours -= 24
        }
        
        print("\(hours) \(minutes)")
    }
}
