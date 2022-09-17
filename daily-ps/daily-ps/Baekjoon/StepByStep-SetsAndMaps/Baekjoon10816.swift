//
//  Baekjoon10816.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/18.
//

import Foundation

final class Baekjoon10816 {
    func run() {
        var cards: [String: Int] = [:]
        _ = Int(readLine()!)!
        let inputs = readLine()!.split(separator: " ").map{ String($0) }
        
        inputs.forEach {
            cards[$0, default: 0] += 1
        }
        
        _ = Int(readLine()!)!
        let numbers = readLine()!.split(separator: " ").map{ String($0) }
        var result: [String] = []
        
        numbers.forEach {
            let val = String(cards[$0] ?? 0)
            result.append(val)
        }
        
        print(result.joined(separator: " "))
    }
}
