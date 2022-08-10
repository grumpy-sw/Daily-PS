//
//  MinimalRectangle.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/10.
//

import Foundation

final class MinimalRectangle {
    func run() {
        let testCase = [[60, 50], [30, 70], [60, 30], [80, 40]]
        print(solution(testCase))
    }
    
    func solution(_ sizes:[[Int]]) -> Int {
        let sorted = sizes.map({
            $0.sorted()
        })
        
        let width = maxValue(sorted.map{ $0[0] })
        let height = maxValue(sorted.map{ $0[1] })
        
        return width * height
    }
    
    func maxValue(_ values: [Int]) -> Int {
        var max = 0
        
        values.forEach {
            if max < $0 {
                max = $0
            }
        }
        return max
    }
}
