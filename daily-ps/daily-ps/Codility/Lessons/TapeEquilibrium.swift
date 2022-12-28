//
//  TapeEquilibrium.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/29.
//

import Foundation

final class TapeEquilibrium {
    func run() {
        var A = [3, 1, 1]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let sums = cumulativeSums(A)
        var diff = Int.max
        for index in 1..<A.count {
            let left = sums[index - 1]
            let right = sums.last! - sums[index - 1]
            
            diff = min(diff, abs(left - right))
        }
        
        return diff
    }
    
    func cumulativeSums(_ numbers: [Int]) -> [Int] {
        var result = [Int]()
        var sum = 0
        for index in 0..<numbers.count {
            sum += numbers[index]
            result.append(sum)
        }
        return result
    }
}
