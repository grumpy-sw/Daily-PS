//
//  Baekjoon2562.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon2562 {
    func run() {
        solution()
    }
    
    func solution() {
        var numbers: [Int] = []
        var maxElement: Int = 0
        var maxIndex: Int = 0
        for _ in 0..<9 {
            numbers.append(Int(readLine()!)!)
        }
        
        for index in 0..<9 {
            if numbers[index] > maxElement {
                maxElement = numbers[index]
                maxIndex = index
            }
        }
        
        print(maxElement)
        print(maxIndex+1)
    }
}
