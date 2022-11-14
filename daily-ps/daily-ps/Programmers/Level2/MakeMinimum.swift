//
//  MakeMinimum.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/14.
//

import Foundation

final class MakeMininum {
    func run() {
        print(solution([1, 4, 2], [5, 4, 4]))
    }
    
    func solution(_ A: [Int], _ B: [Int]) -> Int {
        var ans = 0
        
        let arrayA = A.sorted()
        let arrayB = B.sorted { n1, n2 in
            return n1 > n2
        }
        
        for index in 0..<A.count {
            ans += (arrayA[index] * arrayB[index])
        }

        return ans
    }
}
