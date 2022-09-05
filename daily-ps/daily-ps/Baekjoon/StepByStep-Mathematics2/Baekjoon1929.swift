//
//  Baekjoon1929.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon1929 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        let min = numbers[0]
        let max = numbers[1]
        
        for number in min...max {
            if checkPrimeNumber(number) {
                print(number)
            }
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
