//
//  Baekjoon1018.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/06.
//

import Foundation

final class Baekjoon1018 {
    func run() {
        solution()
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let row = input[0]
        let col = input[1]
        var result = 64
        
        var board: [[String]] = []
        
        for _ in 0..<row {
            board.append(Array(readLine()!).map{ String($0) })
        }
        
        for r in 0..<row {
            for c in 0..<col {
                if isIn(r, c, row, col) {
                    let map = sliceToMap(r, c, board)
                    let cost = min(fillTopBlack(map), fillTopWhite(map))
                    if result > cost {
                        result = cost
                    }
                }
            }
        }
        
        
        print(result)
    }
    
    func sliceToMap(_ r: Int, _ c: Int, _ board: [[String]]) -> [[String]] {
        var result: [[String]] = []
        
        for index in 0..<8 {
            let slice = Array(board[r + index][c...(c+7)])
            result.append(slice)
        }
        
        return result
    }
    
    func fillTopWhite(_ map: [[String]]) -> Int {
        var cost = 0
        for r in 0..<8 {
            for c in 0..<8 {
                if ((r+c) % 2 == 0 && map[r][c] != "W") || ((r+c) % 2 == 1 && map[r][c] != "B") {
                    cost += 1
                }
            }
        }
        
        return cost
    }
    
    func fillTopBlack(_ map: [[String]]) -> Int {
        var cost = 0
        for r in 0..<8 {
            for c in 0..<8 {
                if ((r+c) % 2 == 0 && map[r][c] != "B") || ((r+c) % 2 == 1 && map[r][c] != "W") {
                    cost += 1
                }
            }
        }
        return cost
    }
    
    func isIn(_ y: Int, _ x: Int, _ r: Int, _ c: Int) -> Bool {
        return y >= 0 && x >= 0 && (y + 7) < r && (x + 7) < c
    }
}
