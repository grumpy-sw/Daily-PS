//
//  Baekjoon8393.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon8393 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var sum = 0
        
        for index in 1...n {
            sum += index
        }
        
        print(sum)
    }
}
