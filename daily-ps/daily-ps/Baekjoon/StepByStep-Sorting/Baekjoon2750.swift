//
//  Baekjoon2750.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/07.
//

import Foundation

final class Baekjoon2750 {
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        var numbers = [Int]()
        for _ in 0..<N {
            numbers.append(Int(readLine()!)!)
        }
        
        let sortedNumbers = numbers.sorted()
        sortedNumbers.forEach {
            print($0)
        }
    }
}
