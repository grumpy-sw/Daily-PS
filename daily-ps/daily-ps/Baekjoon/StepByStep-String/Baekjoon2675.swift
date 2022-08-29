//
//  Baekjoon2675.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon2675 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var result: [String] = []
        
        for _ in 0..<n {
            let oneLine = readLine()!.split(separator: " ").map{ String($0) }
            let count = Int(oneLine[0])!
            let arr = Array(oneLine[1]).map{ String($0) }
            
            var answer = ""
            arr.forEach {
                for _ in 0..<count {
                    answer += $0
                }
            }
            result.append(answer)
        }
        
        result.forEach {
            print($0)
        }
    }
}
