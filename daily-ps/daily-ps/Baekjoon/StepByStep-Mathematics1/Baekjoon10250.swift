//
//  Baekjoon10250.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon10250 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var cases: [[Int]] = []
        var result: [Int] = []
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            cases.append(input)
        }
        
        for index in 0..<n {
            let H = cases[index][0] // 호텔의 층 수
            let W = cases[index][1] // 각 층의 방 수
            let N = cases[index][2] // 몇 번째 손님
            
            var count = 0
            
            for number in 1...W {
                for floor in 1...H {
                    count += 1
                    if count == N {
                        result.append(floor * 100 + number)
                        break
                    }
                }
            }
        }
        result.forEach {
            print($0)
        }
    }
}
