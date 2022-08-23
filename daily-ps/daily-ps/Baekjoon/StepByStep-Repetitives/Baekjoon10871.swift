//
//  Baekjoon10871.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon10871 {
    func run() {
        solution()
    }
    
    func solution() {
        let oneLine = readLine()!.split(separator: " ").map { Int($0)! }
        let n = oneLine[0]
        let x = oneLine[1]
        
        var numbers = readLine()!.split(separator: " ").map { Int($0)! }
            .filter{
                $0 < x
            }
        
        numbers.forEach {
            print($0, terminator: " ")
        }
    }
}
