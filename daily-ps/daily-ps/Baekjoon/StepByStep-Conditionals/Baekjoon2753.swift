//
//  Baekjoon2753.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon2753 {
    func run() {
        solution()
    }
    
    func solution() {
        let year = Int(readLine()!)!
        var isLeapYear = false
        
        if year % 4 == 0 {
            if year % 400 == 0 {
                isLeapYear = true
            } else if year % 100 == 0 {
                isLeapYear = false
            } else {
                isLeapYear = true
            }
        }
        
        print(isLeapYear == true ? 1 : 0)
    }
}
