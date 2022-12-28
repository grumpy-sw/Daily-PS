//
//  CyclicRotation.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/28.
//

import Foundation

final class CyclicRotation {
    func run() {
        var A: [Int] = []
        print(solution(&A, 3))
    }
    
    func solution(_ A : inout [Int], _ K : Int) -> [Int] {
        if A.isEmpty {
            return A
        }
        
        var result = Array(repeating: 0, count: A.count)
        // Implement your solution here
        
        let rotateCount = K % A.count
        
        for index in 0..<A.count {
            if index + rotateCount < A.count {
                result[index + rotateCount] = A[index]
            } else {
                result[index + rotateCount - A.count] = A[index]
            }
        }
        
        return result
    }
}
