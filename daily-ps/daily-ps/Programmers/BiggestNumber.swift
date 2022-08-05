//
//  BiggestNumber.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/04.
//

import Foundation

final class BiggestNumber {
    func run() {
        var testCase: [Int] = [3, 30, 34, 5, 9]
        print(solution(testCase))
    }
    
    func solution(_ numbers: [Int]) -> String {
        var result: String = ""
        
        let sorted: [Int] = numbers.sorted().sorted { num1, num2 in
            let before = Array(Array(repeating: String(num1), count: 3).joined(separator: ""))
            let after = Array(Array(repeating: String(num2), count: 3).joined(separator: ""))
            return compareTwoNumberUnits(before, after)
        }
        if sorted[0] == 0 {
            return "0"
        }
        result = sorted.map{ String($0) }.joined(separator: "")
        
        return result
    }
    
    func compareTwoNumberUnits(_ num1: [Character], _ num2: [Character]) -> Bool {
        let count = min(num1.count, num2.count)
        
        for index in 0..<count {
            let unitInBefore = characterInNumber(num1, offset: index)
            let unitInAfter = characterInNumber(num2, offset: index)
            if unitInBefore != unitInAfter {
                return unitInBefore > unitInAfter
            }
        }
        return false
    }
    
    func characterInNumber(_ number: [Character], offset: Int) -> Int {
        return Int(String(number[offset]))!
    }
}
