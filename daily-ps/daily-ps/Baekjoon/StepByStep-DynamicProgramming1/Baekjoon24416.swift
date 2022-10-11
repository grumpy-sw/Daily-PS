//
//  Baekjoon24416.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/11.
//

import Foundation

final class Baekjoon24416 {
    
    var count: Int = 0
    
    func run() {
        let n = Int(readLine()!)!
        
        print("\(fib(n)) \(fibonacci(n))")
    }
    
    func fib(_ n: Int) -> Int {
        if (n == 1) || (n == 2) {
            return 1
        } else {
            return fib(n - 1) + fib(n - 2)
        }
    }
    
    func fibonacci(_ n: Int) -> Int {
        return (n > 2) ? (n - 2) : 1
    }
}
