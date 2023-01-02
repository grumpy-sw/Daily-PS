//
//  PermCheck.swift
//  daily-ps
//
//  Created by 박세웅 on 2023/01/01.
//

import Foundation

final class PermCheck {
    func run() {
        var A = [1]
        print(solution(&A))
    }

    public func solution(_ A : inout [Int]) -> Int {
        var permutation = Array(repeating: false, count: A.count + 1)
        permutation[0] = true
        for number in A {
            if number >= permutation.count {
                return 0
            }
            permutation[number] = true
        }
        if permutation.contains(false) {
            return 0
        }
        return 1
    }
}
