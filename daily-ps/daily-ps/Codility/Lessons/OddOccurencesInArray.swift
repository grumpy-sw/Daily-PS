//
//  OddOccurencesInArray.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/28.
//

import Foundation

final class OddOccurencesInArray {
    func run() {
        var A: [Int] = [4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 4]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        if A.count == 1 {
            return A[0]
        }
        var result = 0
        let numbers = A.sorted()
        var stack = [Int]()
        for number in numbers {
            if stack.isEmpty {
                stack.append(number)
            } else {
                let last = stack.last!
                if number == last {
                    stack.removeLast()
                } else {
                    break
                }
            }
        }
        result = stack.removeLast()
        return result
    }
}
