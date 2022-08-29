//
//  Baekjoon11720.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon11720 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        let oneLine = Array(readLine()!).map { String($0) }
        var sum: Int = 0
        
        for index in 0..<n {
            sum += Int(oneLine[index])!
        }
        print(sum)
    }
}
