//
//  MakingDots.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/02.
//

import Foundation

final class MakingDots {
    func run() {
        print(solution(1, 5))
    }
    
    func solution(_ k: Int, _ d: Int) -> Int {
        var count = 0
        for x in stride(from: 0, through: d, by: k) {
            let y = maxY(x, d)
            count += ((y / k) + 1)
        }
        
        return count
    }
    
    func maxY(_ x: Int, _ d: Int) -> Int {
        return Int(sqrt(Double(d * d - x * x)))
    }
    
}
