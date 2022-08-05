//
//  KthNumber.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/04.
//

import Foundation

final class KthNumber {
    func run() {
        print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])) // [5, 6, 3]
    }
    
    func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
        var result: [Int] = []
        
        for index in 0..<commands.count {
            let startIndex = commands[index][0] - 1
            let endIndex = commands[index][1] - 1
            let pickedNumberIndex = commands[index][2] - 1
            let sliced = array[startIndex...endIndex].sorted()
            result.append(sliced[pickedNumberIndex])
        }
        return result
    }
}
