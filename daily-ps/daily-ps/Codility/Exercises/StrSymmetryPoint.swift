//
//  StrSymmetryPoint.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/31.
//

import Foundation

final class StrSymmetryPoint {
    func run() {
        var S = "racecar"
        print(solution(&S))
    }
    
    public func solution(_ S : inout String) -> Int {
        let n = S.count
        let strArray = Array(S)
        if n % 2 == 0 {
            return -1
        }
        
        if n == 1 {
            return 0
        }
        
        for index in 0..<(n/2) {
            if strArray[index] != strArray[n - index - 1] {
                return -1
            }
        }
        
        return n/2
    }
}
