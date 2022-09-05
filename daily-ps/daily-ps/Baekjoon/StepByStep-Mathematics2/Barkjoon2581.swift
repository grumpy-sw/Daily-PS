//
//  Barkjoon2581.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon2581 {
    func run() {
        solution()
    }
    
    func solution() {
        let min = Int(readLine()!)!
        let max = Int(readLine()!)!
        
        var primeNumbers = [Int]()
        
        for number in min...max {
            if checkPrimeNumber(number) {
                primeNumbers.append(number)
            }
        }
        
        if primeNumbers.isEmpty {
            print("-1")
        } else {
            print(primeNumbers.reduce(0, +))
            print(primeNumbers.sorted().first!)
        }
    }
    
    func checkPrimeNumber(_ number: Int) -> Bool {
        if number == 1 {
            return false
        }
        
        if number == 2 || number == 3 {
            return true
        }
        
        for num in 2...(number / 2){
            if number % num == 0 {
                return false
            }
        }
        return true
    }
}
