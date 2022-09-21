//
//  Carpet.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/15.
//

import Foundation

final class Carpet {
    func run() {
        print(solution(10, 2))
    }
    
    func solution(_ brown:Int, _ yellow:Int) -> [Int] {
        let total = brown + yellow
        var result: [Int] = []
        let squares = makeNumberSquares(yellow)
        
        for square in squares {
            if (square[0] + 2) * (square[1] + 2) == total {
                result.append(square[0] + 2)
                result.append(square[1] + 2)
            }
        }
        
        return result.sorted { before, after in
            return before > after
        }
    }
    
    func makeNumberSquares(_ yellow: Int) -> [[Int]] {
        var result: [[Int]] = []
        let sqrtNumber: Int = Int(sqrt(Double(yellow)))
        for index in 1...sqrtNumber {
            if yellow % index == 0 {
                result.append([index, yellow / index])
            }
        }
        
        return result
    }
}
