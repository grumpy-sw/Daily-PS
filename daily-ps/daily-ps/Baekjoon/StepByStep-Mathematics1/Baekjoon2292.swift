//
//  Baekjoon2292.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon2292 {
    func run() {
        solution()
    }
    
    func solution() {
        let target = Int(readLine()!)!
        var count = 1
        var result = 1
        
        while true {
            if target <= count {
                print(result)
                break
            } else {
                count += (6 * result)
                result += 1
            }
        }
    }
}
