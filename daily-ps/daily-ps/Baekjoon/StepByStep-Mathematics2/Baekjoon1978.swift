//
//  Baekjoon1978.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon1978 {
    func run() {
        solution()
    }
    
    func solution() {
        var count = 0
        _ = readLine()
        let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
        numbers.forEach {
            if checkPrimeNumber($0) {
                count += 1
            }
        }
        
        print(count)
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
