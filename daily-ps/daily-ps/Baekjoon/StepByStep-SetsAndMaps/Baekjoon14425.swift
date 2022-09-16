//
//  Baekjoon14425.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/16.
//

import Foundation

final class Baekjoon14425 {
    func run() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let N = input[0]
        let M = input[1]
        var count = 0
        var stringPool: [String: Int] = [:]
        for _ in 0..<N {
            stringPool.updateValue(0, forKey: readLine()!)
        }
        
        for _ in 0..<M {
            let word = readLine()!
            if stringPool[word] != nil {
                count += 1
            }
        }
        
        print(count)
    }
}
