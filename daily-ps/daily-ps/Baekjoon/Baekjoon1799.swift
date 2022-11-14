//
//  Baekjoon1799.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/26.
//

import Foundation

final class Baekjoon1799 {
    var board: [[String]] = []
    var colored: [[Int]] = []
    var visited: [[Bool]] = []
    let dirs: [[Int]] = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    var N = 0
    var result: [Int] = [0, 0]
    func run() {
        N = Int(readLine()!)!
        for _ in 0..<N {
            board.append(readLine()!.split(separator: " ").map{ String($0) })
        }
        
        visited = Array(repeating: Array(repeating: false, count: N), count: N)
        makeColoredBoard()
        dfs(0, 0, 1, visited)
        dfs(1, 0, 0, visited)
        
        print(result.reduce(0, +))
    }
    
    func makeColoredBoard() {
        colored = Array(repeating: Array(repeating: 0, count: N), count: N)
        
        for row in 0..<N {
            for col in 0..<N {
                if row % 2 == 0 {
                    if col % 2 == 0 {
                        colored[row][col] = 1
                    }
                } else {
                    if col % 2 != 0 {
                        colored[row][col] = 1
                    }
                }
            }
        }
    }
    
    func dfs(_ index: Int, _ count: Int, _ color: Int, _ visited: [[Bool]]) {
        if result[color] < count {
            result[color] = count
        }
        
        if index >= N*N {
            return
        }
        
        let row = index / N
        let col = index % N
 
        if colored[row][col] != color {
            dfs(index+1, count, color, visited)
        } else {
            if board[row][col] == "1", isValid(row, col, visited) {
                var visited = visited
                visited[row][col] = true
                dfs(index+1, count+1, color, visited)
            }
            dfs(index+1, count, color, visited)
        }
    }
    
    func isValid(_ row: Int, _ col: Int, _ visited: [[Bool]]) -> Bool {
        for i in 0..<4 {
            for j in 1..<N {
                let nr = row + (dirs[i][0] * j)
                let nc = col + (dirs[i][1] * j)
                
                if !isIn(nr, nc) {
                    break
                }
                
                if visited[nr][nc] {
                    return false
                }
            }
        }
        return true
    }
    
    func isIn(_ r: Int, _ c: Int) -> Bool {
        return r >= 0 && c >= 0 && r < N && c < N
    }
}
