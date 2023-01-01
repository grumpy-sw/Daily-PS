//
//  FrogRiverOne.swift
//  daily-ps
//
//  Created by 박세웅 on 2023/01/01.
//

import Foundation

final class FrogRiverOne {
    func run() {
        let X = 5
        var A = [1,3,1,4,2,3,5,4]
        print(solution(X, &A))
    }
    
    public func solution(_ X : Int, _ A : inout [Int]) -> Int {
        var leaves = [Int: Int]()

        for index in 0..<A.count {
            leaves[A[index]] = index
            
            if leaves.count == X {
                return index
            }
        }
        return -1
    }
}
