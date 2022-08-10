//
//  Baekjoon1941.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/07.
//

import Foundation

final class Baekjoon1941 {
    func run() {
        solution()
    }
    
    var result: Int = 0
    let dirs: [[Int]] = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    var points: [Point] = []
    func solution() {
        for line in 0..<5 {
            let oneLine = Array(readLine()!).map{ String($0) }
            for index in 0..<oneLine.count {
                points.append(Point(x: index, y: line, team: oneLine[index]))
            }
        }
        pick([], offset: 0)
        print(result)
    }
    
    func pick(_ now: [Point], offset: Int) {
        if now.count == 7 {
            if !isConnected(now) {
                return
            }
            if now.filter ({ $0.team == "S" }).count >= 4 {
                self.result += 1
            }
            return
        }
        
        for index in offset..<points.count {
            pick(now + [points[index]], offset: index+1)
        }
    }
    
    func isConnected(_ picked: [Point]) -> Bool {
        let map = picked.map {
            [$0.x, $0.y]
        }
        var count = 1
        var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
        var queue: [[Int]] = [map[0]]
        
        while !queue.isEmpty {
            if count == 7 {
                return true
            }
            let front = queue.removeFirst()
            visited[front[0]][front[1]] = true
            for dir in dirs {
                let nx = front[0] + dir[1]
                let ny = front[1] + dir[0]
                if isIn(nx, ny), map.contains([nx, ny]), !visited[nx][ny] {
                    visited[nx][ny] = true
                    count += 1
                    queue.append([nx, ny])
                }
            }
        }
        
        return false
    }
    
    func isIn(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && y >= 0 && x < 5 && y < 5
    }
    
    struct Point {
        let x: Int
        let y: Int
        let team: String
    }
}
