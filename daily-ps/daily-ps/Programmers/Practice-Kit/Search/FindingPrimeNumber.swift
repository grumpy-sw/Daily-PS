//
//  FindingPrimeNumber.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/11.
//

import Foundation

final class FindingPrimeNumber {
    func run() {
        print(solution("1234"))
    }
    
    func solution(_ numbers:String) -> Int {
        var result: [Int] = []
        let strings = Array(numbers).map{ String($0) }
        
        for num in 0..<strings.count {
            let perm = permutation(strings, num+1)
            perm.forEach {
                let number = Int($0.joined())!
                result.append(number)
            }
        }
        result = findPrimeNumber(in: removeDuplicatedElements(in: result))
        return result.count
    }
    
    func permutation(_ numbers: [String], _ length: Int) -> [[String]] {
        var result: [[String]] = []
        
        if numbers.count < length {
            return result
        }
        var visited: [Bool] = Array(repeating: false, count: numbers.count)
        
        func pick(_ now: [String]) {
            if now.first == "0" {
                return
            }
            
            if now.count == length {
                result.append(now)
                return
            }
            
            for i in 0..<numbers.count {
                if visited[i] == false {
                    visited[i] = true
                    pick((now + [numbers[i]]))
                    visited[i] = false
                }
            }
        }
        
        pick([])
        return result
    }
    
    func removeDuplicatedElements(in array: [Int]) -> [Int] {
        let set: Set = Set(array)
        return Array(set)
    }
    
    func findPrimeNumber(in array: [Int]) -> [Int] {
        var result: [Int] = []
        
        for num in array {
            if isPrimeNumber(num) {
                result.append(num)
            }
        }
        return result
    }
    
    func isPrimeNumber(_ number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        if number == 2 || number == 3 {
            return true
        }
    
        for num in 2...Int(sqrt(Double(number))) {
            if number % num == 0 {
                return false
            }
        }
        return true
    }
    
}
