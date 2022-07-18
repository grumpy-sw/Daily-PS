//
//  Baekjoon1012.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/18.
//

import Foundation

let testInput = """
2
10 8 17
0 0
1 0
1 1
4 2
4 3
4 5
2 4
3 4
7 4
8 4
9 4
7 5
8 5
9 5
7 6
8 6
9 6
10 10 1
5 5
"""

final class Baekjoon1012: Baekjoon {
    var answer: Int = 0
    var k: Int = 0
    var r: Int = 0
    var c: Int = 0
    var map: [[Int]] = []
    var visited: [[Bool]] = []
    let dirs: [[Int]] = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    
    override func run() {
        guard let testCaseNumber = Int(readLine() ?? "0") else { return }
        
        for _ in 0..<testCaseNumber {
            guard let input = readLine()?.split(separator: " ").compactMap({
                Int($0)
            }) else { return }
            answer = 0
            map = []
            visited = []
            r = input[0]
            c = input[1]
            k = input[2]
            
            for _ in 0..<r {
                
                var tempMap: [Int] = []
                var tempVisited: [Bool] = []
                for _ in 0..<c {
                    tempMap.append(0)
                    tempVisited.append(false)
                }
                map.append(tempMap)
                visited.append(tempVisited)
            }
            
            for _ in 0..<k {
                if let position = readLine()?.split(separator: " ").compactMap({
                    Int($0)
                }) {
                    let row = position[0]
                    let col = position[1]
                    map[row][col] = 1
                }
            }
            solution()
        }
    }
    
    func solution() {
        var answer = 0
        
        for row in 0..<r {
            for col in 0..<c {
                if map[row][col] == 1, !visited[row][col] {
                    bfs(row, col)
                    answer += 1
                }
            }
        }
        print(answer)
    }
    
    func bfs(_ row: Int, _ col: Int) {
        var queue = [Point]()
        visited[row][col] = true
        queue.append(Point(r: row, c: col))
        
        while !queue.isEmpty {
            let front = queue.popLast()!
            for dir in dirs {
                let nextCol = front.c + dir[0]
                let nextRow = front.r + dir[1]
                
                if isIn(nextRow, nextCol), map[nextRow][nextCol] == 1, !visited[nextRow][nextCol] {
                    visited[nextRow][nextCol] = true
                    queue.append(Point(r: nextRow, c: nextCol))
                }
            }
        }
    }
    
    struct Point {
        var r: Int
        var c: Int
    }
    
    func isIn(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < r && y >= 0 && y < c
    }
}
