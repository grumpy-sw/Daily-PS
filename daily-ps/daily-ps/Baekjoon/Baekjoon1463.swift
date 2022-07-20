//
//  Baekjoon1463.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/21.
//

import Foundation

// testInput = 2 Output = 1
// testInput = 10 Output = 3
final class Baekjoon1463: Baekjoon {
    var map: [Int] = []
    
    override func run() {
        let number: Int = Int(readLine()!)!
        map.append(0)
        map.append(0)
        
        solution(number)
    }
    
    func solution(_ number: Int) {
        for index in 2..<(number+1) {
            // 일단 3의 방법으로 계산
            map.append(map[index - 1] + 1)
            // 1의 방법과 비교
            if index % 3 == 0 {
                map[index] = min(map[index], map[index / 3] + 1)
            }
            // 2의 방법과 비교
            if index % 2 == 0 {
                map[index] = min(map[index], map[index / 2] + 1)
            }
        }
        
        print(map[number])
    }
}
