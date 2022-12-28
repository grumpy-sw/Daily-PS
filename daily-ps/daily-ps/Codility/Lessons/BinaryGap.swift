//
//  Lesson1.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/27.
//

import Foundation

final class BinaryGap {
    func run() {
        let N = Int(readLine()!)!
        print(solution(N))
    }
    
    func solution(_ N : Int) -> Int {
        let binaryNumbers = String(N, radix: 2)
        let binaryGaps = binaryNumbers.components(separatedBy: "1")
        var length = 0
        for index in 1..<binaryGaps.count - 1 {
            length = max(length, binaryGaps[index].count)
        }
        return length
    }
}
