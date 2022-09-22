//
//  SecretMap.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/22.
//

// Level 1. 비밀지도

import Foundation

final class SecretMap {
    func run() {
        print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
    }
    
    func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var answer: [String] = []
        
        for index in 0..<n {
            var line1 = Array(String(arr1[index], radix: 2)).map { String($0) }
            var zeroArray = Array(repeating: "0", count: n - line1.count)
            line1 = zeroArray + line1
            
            var line2 = Array(String(arr2[index], radix: 2)).map { String($0) }
            zeroArray = Array(repeating: "0", count: n - line2.count)
            line2 = zeroArray + line2
            
            var line: [String] = []
            for i in 0..<n {
                line.append((line1[i] == "1" || line2[i] == "1") ? "#" : " ")
            }
            answer.append(line.joined())
        }
        
        return answer
    }
}
