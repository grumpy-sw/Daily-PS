//
//  PassingCars.swift
//  daily-ps
//
//  Created by 박세웅 on 2023/01/02.
//

import Foundation

final class PassingCars {
    func run() {
        var A = [0, 1, 0, 1, 1]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var eastCars = 0
        var count = 0
        for index in 0..<A.count {
            if A[index] == 0 {
                eastCars += 1
            } else {
                count += eastCars
            }
        }

        return count > 1000000000 ? -1 : count
    }
}
