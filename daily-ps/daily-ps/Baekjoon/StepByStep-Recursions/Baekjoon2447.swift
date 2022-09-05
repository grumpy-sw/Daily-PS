//
//  Baekjoon2447.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon2247 {
    
    var result: String = ""
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        for row in 0..<N {
            for col in 0..<N {
                printStar(N, row, col)
            }
            result += "\n"
        }
        
        print(result)
    }
    
    func printStar(_ n: Int, _ row: Int, _ col: Int) {
        if (row / n) % 3 == 1, (col / n) % 3 == 1 {
            result += " "
        } else {
            if n / 3 == 0 {
                result += "*"
            } else {
                printStar(n / 3, row, col)
            }
        }
    }
}
