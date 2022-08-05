//
//  TargetNumber.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/05.
//

import Foundation

final class TargetNumber {
    var result: Int = 0
    
    func run() {
        print(solution([1, 1, 1, 1, 1], 3))    // 5
    }
    
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        
        calculate(numbers, current: 0, target: target, offset: 0)
        return result
    }
    
    func calculate(_ numbers: [Int], current: Int, target: Int, offset: Int) {
        if offset == numbers.count {
            if current == target {
                result += 1
            }
            return
        }
        calculate(numbers, current: -1 * numbers[offset] + current, target: target, offset: offset + 1)
        calculate(numbers, current: numbers[offset] + current, target: target, offset: offset + 1)
    }
}
