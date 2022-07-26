//
//  Baekjoon2578.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/27.
//

import Foundation

final class Baekjoon2578 {
    func run() {
        var map: [[Int]] = []
        
        for _ in 0..<5 {
            let oneLine: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
            map.append(oneLine)
        }
        
        var numberPool: [Int] = []
        for _ in 0..<5 {
            let oneLine: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
            oneLine.forEach {
                numberPool.append($0)
            }
        }
        
        print(solution(map, numberPool))
    }
    
    func solution(_ map: [[Int]], _ numberPool: [Int]) -> Int {
        var numbers: [Int] = numberPool
        var bingo: Int = 0
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 5), count: 5)
        var count: Int = 0
        
        while !numbers.isEmpty {
            let number = numbers.removeFirst()
            count += 1
            
            for row in 0..<5 {
                for col in 0..<5 {
                    if map[row][col] == number {
                        visited[row][col] = true
                    }
                }
            }
            
            bingo = 0
            for index in 0..<5 {
                if visited[index][0] && visited[index][1] && visited[index][2] && visited[index][3] && visited[index][4] {
                    bingo += 1
                }
                if visited[0][index] && visited[1][index] && visited[2][index] && visited[3][index] && visited[4][index] {
                    bingo += 1
                }
            }
            
            if bingo >= 3 {
                return count
            }
            
            if visited[0][0] && visited[1][1] && visited[2][2] && visited[3][3] && visited[4][4] {
                bingo += 1
            }
            if visited[0][4] && visited[1][3] && visited[2][2] && visited[3][1] && visited[4][0] {
                bingo += 1
            }
            
            if bingo >= 3 {
                return count
            }
        }
        return count
    }
}
