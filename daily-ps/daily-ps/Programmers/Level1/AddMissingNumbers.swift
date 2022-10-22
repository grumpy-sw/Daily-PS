//
//  AddMissingNumbers.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 없는 숫자 더하기
import Foundation

final class AddMissingNumbers {
    func run() {
        print(solution([1,2,3,4,6,7,8,0]))
    }
    
    func solution(_ numbers:[Int]) -> Int {
        let sum = numbers.reduce(0, +)
        
        return 45 - sum
    }
}
