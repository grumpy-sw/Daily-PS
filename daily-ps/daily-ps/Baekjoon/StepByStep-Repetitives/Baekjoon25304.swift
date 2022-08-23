//
//  Baekjoon25304.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon25304 {
    func run() {
        solution()
    }
    
    func solution() {
        let total = Int(readLine()!)!
        let n = Int(readLine()!)!
        var sum: Int = 0
        
        for _ in 0..<n {
            let oneLine = readLine()!.split(separator: " ").map { Int($0)! }
            let price = oneLine[0] * oneLine[1]
            sum += price
        }
        
        if sum == total {
            print("Yes")
        } else {
            print("No")
        }
    }
}
