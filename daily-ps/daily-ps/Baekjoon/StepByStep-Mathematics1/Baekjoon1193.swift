//
//  Baekjoon1193.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon1193 {
    func run() {
        solution()
    }
    
    func solution() {
        var count = 1
        var length = 1
        let target = Int(readLine()!)!
        
        while true {
            if count >= target {
                break
            }
            length += 1
            count += length
        }
        
        let distance = count - target
        var denominator = 1
        var numerator = 1
        if length % 2 == 1 {
            denominator = length - distance
            numerator = 1 + distance
        } else {
            denominator = 1 + distance
            numerator = length - distance
        }
        print("\(numerator)/\(denominator)")
    }
}
