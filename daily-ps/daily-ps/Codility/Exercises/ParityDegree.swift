//
//  ParityDegree.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/31.
//

import Foundation

final class ParityDegree {
    func run() {
        print(solution(4))
    }
    
    public func solution(_ N : Int) -> Int {
        var number = N
        var count = 0
        
        while number % 2 == 0 {
            number /= 2
            count += 1
        }
        
        return count
    }
}
