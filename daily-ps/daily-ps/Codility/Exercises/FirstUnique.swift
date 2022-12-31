//
//  FirstUnique.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/31.
//

import Foundation

final class FirstUnique {
    func run() {
        var A = [4, 10, 5, 4, 2, 10]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var dict: [Int: Int] = [:]
        
        for number in A {
            if let count = dict[number] {
                dict[number] = 1 + count
            } else {
                dict[number] = 1
            }
        }
        
        for number in A {
            if dict[number] == 1 {
                return number
            }
        }
        
        return -1
    }
}
