//
//  Baekjoon9095.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/22.
//

import Foundation

final class Baekjoon9095: Baekjoon {
    override func run() {
        let testCaseCount: Int = Int(readLine()!)!
        var map: [Int] = []
        map.append(0)
        
        // 기본적으로 주어진 1, 2, 3의 방법
        // F(1) = 1, F(2) = 2, F(3) = 4
        map.append(1)
        map.append(2)
        map.append(4)
        for number in 4..<11 {
            // 모든 수를 1, 2, 3의 합으로 나타내려면
            // N = 1 + (N-1), N = 2 + (N-2), N = 3 + (N-3) 로 나타낼 수 있다.
            // F(1) = 1, F(2) = 2, F(3) = 4 이라고 하면
            // F(N) = F(N-1) + F(N-2) + F(N-3) 이라고 나타낼 수 있다.
            map.append(map[number - 1] + map[number - 2] + map[number - 3])
        }
        
        var numbers: [Int] = []
        for _ in 0..<testCaseCount {
            numbers.append(Int(readLine()!)!)
        }
        
        numbers.forEach {
            print(map[$0])
        }
    }
}
