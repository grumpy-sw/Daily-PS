//
//  PermMissingElem.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/29.
//

import Foundation

final class PermMissingElem {
    func run() {
        var A = [1]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        if A.isEmpty {
            return 1
        }
        
        let correctNumbers = Array<Int>(1...A.count+1)
        let sortedNumbers = A.sorted()
        
        for index in 0..<A.count {
            if correctNumbers[index] != sortedNumbers[index] {
                return correctNumbers[index]
            }
        }
        
        return correctNumbers.last!
    }
}
