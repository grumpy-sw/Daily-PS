//
//  ArrListLen.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/31.
//

import Foundation

final class ArrListLen {
    func run() {
        var A = [1, 4, -1, 3, 2]
        print(solution(&A))
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        var index = 0
        var len = 0
        
        while true {
            len += 1
            let next = A[index]
            if next == -1 {
                break
            }
            index = next
        }
        
        return len
    }
}
