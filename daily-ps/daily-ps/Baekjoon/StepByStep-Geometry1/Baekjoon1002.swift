//
//  Baekjoon1002.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/28.
//

import Foundation

final class Baekjoon1002 {
    func run() {
        let T = Int(readLine()!)!
        
        for _ in 0..<T {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let r1 = input[2]
            let r2 = input[5]
            
            let distance = sqrt(pow(Double(input[0]) - Double(input[3]), 2.0) + pow(Double(input[1]) - Double(input[4]), 2.0))
            
            if distance == 0, r1 == r2 {
                print(-1)
            } else if distance == 0, r1 != r2 {
                print(0)
            } else if distance == Double(r1 + r2) || Double(abs(r1 - r2)) == distance {
                print(1)
            } else if Double(abs(r1 - r2)) < distance, distance < Double(r1 + r2) {
                print(2)
            } else {
                print(0)
            }
        }
    }
}
