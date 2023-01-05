//
//  Triangle.swift
//  daily-ps
//
//  Created by 박세웅 on 2023/01/05.
//

import Foundation

final class Triangle {
    func run() {
        var A: [Int] = [1, 1, 1, 1, 5, 5, 5]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        let A = A.filter{ $0 > 0 }.sorted()
        if A.count < 3 {
            return 0
        }
        
        for index in 0..<A.count - 2 {
            if A[index] + A[index + 1] - A[index+2] > 0 {
                return 1
            }
        }
        
        return 0
    }
}
