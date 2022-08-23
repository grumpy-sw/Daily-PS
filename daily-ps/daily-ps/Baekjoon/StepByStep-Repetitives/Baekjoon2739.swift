//
//  Baekjoon2739.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon2739 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        
        for index in 1...9 {
            print("\(n) * \(index) = \(n * index)")
        }
    }
}
