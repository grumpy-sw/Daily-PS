//
//  DivideNumberCards.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/19.
//

// Level 2. 숫자 카드 나누기

import Foundation

final class DivideNumberCards {
    func run() {
        print(solution([3], [17]))
    }
    
    func solution(_ arrayA: [Int], _ arrayB: [Int]) -> Int {
//        let numbersFromA = dividableNumbers(arrayA)
//        let numbersFromB = dividableNumbers(arrayB)
//
//        let numberFromA = cannotDividableNumber(arrayB, numbersFromA)
//        let numberFromB = cannotDividableNumber(arrayA, numbersFromB)
//
//        return max(numberFromA, numberFromB)
        print(divisors(of: 1))
        return 0
    }
    
    func dividableNumbers(_ array: [Int]) -> [Int] {
        var result: [Int] = []
        let min = array.sorted { n1, n2 in
            return n1 < n2
        }.first!
        
        for target in divisors(of: min) {
            if canDivide(array, target) {
                result.append(target)
            }
        }
        return result
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
    
    func canDivide(_ array: [Int], _ target: Int) -> Bool {
        for number in array {
            if number % target != 0 {
                return false
            }
        }
        return true
    }
    
    func cannotDividableNumber(_ array: [Int], _ list: [Int]) -> Int {
        if list.isEmpty {
            return 0
        }
        
        for target in list {
            if neverDivide(array, target) {
                return target
            }
        }
        
        return 0
    }
    
    func neverDivide(_ array: [Int], _ target: Int) -> Bool {
        for number in array {
            if number % target == 0 {
                return false
            }
        }
        return true
    }
}
