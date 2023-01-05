//
//  Distinct.swift
//  daily-ps
//
//  Created by 박세웅 on 2023/01/05.
//

import Foundation

final class Distinct {
    func run() {
        var A: [Int] = []
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        // Implement your solution here
        return Set(A).count
    }

}
