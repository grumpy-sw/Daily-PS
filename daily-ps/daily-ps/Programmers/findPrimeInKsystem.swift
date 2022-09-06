//
//  findPrimeInKsystem.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/06.
//

import Foundation

final class findPrimeInKsystem {
    
    func run() {
        print(solution(110011, 10))
    }
    
    func solution(_ n: Int, _ k: Int) -> Int {
        var answer = 0
        let converted = String(n, radix: k)
        let numbers = converted.split(separator: "0").map { Int($0)! }
        numbers.forEach {
            if checkPrimeNumber($0) {
                answer += 1
            }
        }
        
        return answer
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
 
