//
//  Baekjoon11653.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon11653 {
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        
        if N == 1 {
            return
        }
        
        if checkPrimeNumber(N) {
            print(N)
            return
        }
        
        factorize(N)
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
    
    func factorize(_ n: Int) {
        var number = n
        for i in 2...number {
            while number % i == 0 {
                number /= i
                print(i)
            }
        }
    }
}
