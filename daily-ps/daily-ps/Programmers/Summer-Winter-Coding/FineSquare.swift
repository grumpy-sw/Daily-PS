//
//  FineSquare.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/30.
//

import Foundation

final class FineSquare {
    func run() {
        print(solution(8, 12))
    }
    
    func solution(_ w: Int, _ h: Int) -> Int {
        let m = greatestCommonDivisor(w, h)
        return w * h - (w + h - m)
    }
    
    func greatestCommonDivisor(_ num1: Int, _ num2: Int) -> Int {
        let minNum = min(num1, num2)
        let divisorList = divisors(of: minNum)
        
        for divisor in divisorList {
            if num1 % divisor == 0, num2 % divisor == 0 {
                return divisor
            }
        }
        
        return 1
    }
    
    func divisors(of N: Int) -> [Int] {
        if N == 1 {
            return [1]
        } else if N == 2 {
            return [2]
        } else if N == 3 {
            return [3]
        }
        
        var results: [Int] = [N]
        
        for number in 2...Int(sqrt(Double(N))) {
            if number * number == N {
                results.append(number)
            } else if N % number == 0 {
                results.append(number)
                results.append(N/number)
            }
        }
        
        return results.sorted { n1, n2 in
            return n1 > n2
        }
    }
}
