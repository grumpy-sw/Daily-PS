//
//  Baekjoon25305.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/07.
//

import Foundation

final class Baekjoon25305 {
    func run() {
        solution()
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let winners = input[1]
        
        let scores = readLine()!.split(separator: " ").map{ Int($0)! }.sorted { n1, n2 in
            return n1 > n2
        }
        
        print(scores[winners - 1])
    }
}
