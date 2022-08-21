//
//  Network.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/18.
//

import Foundation

final class Network {
    func run() {
        let testCase = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
        print(solution(4, [[1, 1, 0, 1], [1, 1, 0, 0], [0, 0, 1, 1], [1, 0, 1, 1]]))
    }

    
    var visited: [Bool] = []
    
    func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        var count: Int = 0
        visited = Array(repeating: false, count: n)
        
        for index in 0..<n {
            if !visited[index] {
                count += 1
                connectNetwork(n, computers, index)
            }
        }
        return count
    }
    
    func connectNetwork(_ n: Int, _ computers: [[Int]], _ start: Int) {
        visited[start] = true
        for index in 0..<n {
            if !visited[index], computers[start][index] == 1 {
                connectNetwork(n, computers, index)
            }
        }
    }
}
