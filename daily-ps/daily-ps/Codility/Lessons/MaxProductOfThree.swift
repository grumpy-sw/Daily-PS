//
//  MaxProductOfThree.swift
//  daily-ps
//
//  Created by 박세웅 on 2023/01/05.
//

import Foundation

final class MaxProductOfThree {
    func run() {
        var A: [Int] = [-3, 1, 2, -2, 5, 6]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var result = Int.min
        let sortedNumbers = A.sorted()
        let lastIndex = A.count - 1
        
        if sortedNumbers.filter({ $0 < 0 }).count > 1 {
            result = max(result, sortedNumbers[0] * sortedNumbers[1] * sortedNumbers.last!)
        }
        
        result = max(result, sortedNumbers[lastIndex] * sortedNumbers[lastIndex - 1] * sortedNumbers[lastIndex - 2])
        
        return result
    }
}
