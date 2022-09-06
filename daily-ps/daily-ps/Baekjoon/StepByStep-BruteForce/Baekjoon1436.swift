//
//  Baekjoon1436.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/06.
//

import Foundation

final class Baekjoon1436 {
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        
        print(findTitleNumber(N))
    }
    
    func findTitleNumber(_ count: Int) -> Int {
        var attempt = 0
        var number = 666
        while true {
            if checkIsTitleNumber(number) {
                attempt += 1
            }
            
            if attempt == count {
                break
            }
            
            number += 1
        }
        return number
    }
    
    func checkIsTitleNumber(_ number: Int) -> Bool {
        var num = number
        while num >= 666 {
            if num % 1000 == 666 {
                return true
            }
            num /= 10
        }
        return false
    }
}
