//
//  Baekjoon1110.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon1110 {
    func run() {
        solution()
    }
    
    func solution() {
        let number = readLine()!
        var current = number
        var count = 0
        
        while true {
            let next = nextNumber(current)
            count += 1
            if Int(next)! == Int(number)! {
                print(count)
                break
            }
            current = next
        }
    }
    
    func nextNumber(_ number: String) -> String {
        var current = number
        if current.count < 2 {
            current = "0" + current
        }
        
        let numberAsArray = Array(current).map { String($0) }
        let front = numberAsArray[1]
        let back = Array(String(Int(numberAsArray[0])! + Int(numberAsArray[1])!)).map { String($0) }.last!

        return front + back
    }
}
