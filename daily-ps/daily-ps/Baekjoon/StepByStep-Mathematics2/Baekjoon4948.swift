//
//  Baekjoon4948.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon4948 {
    func run() {
        solution()
    }
    
    func solution() {
        var numbers: [Int] = []
        var results: [Int] = []
        while true {
            let n = Int(readLine()!)!
            if n == 0 {
                break
            }
            numbers.append(n)
        }
        
        for number in numbers {
            var count = 0
            for num in (number + 1)...(number * 2) {
                if checkPrimeNumber(num) {
                    count += 1
                }
            }
            results.append(count)
        }
        results.forEach {
            print($0)
        }
    }
    
    func checkPrimeNumber(_ number: Int) -> Bool {
        let n = Int(sqrt(Double(number)))
        if number == 1 {
            return false
        }
        
        if number == 2 || number == 3 {
            return true
        }
        
        for num in 2...n{
            if number % num == 0 {
                return false
            }
        }
        return true
    }
}
