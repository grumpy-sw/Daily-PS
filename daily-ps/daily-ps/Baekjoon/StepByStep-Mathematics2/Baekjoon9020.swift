//
//  Baekjoon9020.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon9020 {
    
    var map: [Int] = []
    func run() {
        solution()
    }
    
    func solution() {
        var numbers: [Int] = []

        let n = Int(readLine()!)!

        for _ in 0..<n {
            numbers.append(Int(readLine()!)!)
        }

        fillTheMap()
        
        numbers.forEach {
            findGoldbach($0)
        }
    }
    
    func fillTheMap() {
        for number in 2...10000 {
            if checkPrimeNumber(number) {
                map.append(number)
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
    
    func findGoldbach(_ number: Int) {
        let primeNumbers = map.filter { $0 <= (number/2) }.reversed()
        
        for prime in primeNumbers {
            let other = number - prime
            if map.contains(other) {
                print(prime, other)
                break
            }
        }
    }
}
