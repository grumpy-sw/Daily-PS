//
//  DisappearingFoothold.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/19.
//

import Foundation

final class DisappearingFoothold {
    func run() {
        print(solution([[1, 1, 1], [1, 1, 1], [1, 1, 1]], [1, 0], [1, 2])) // 4
    }
    
    var row: Int = 0
    var col: Int = 0
    let dirs: [[Int]] = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    
    func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
        row = board.count
        col = board[0].count
        
        let result = dfs(board, Point(y: aloc[0], x: aloc[1]), Point(y: bloc[0], x: bloc[1]))
        return result.1
    }
    
    func dfs(_ board: [[Int]], _ user: Point, _ opponent: Point) -> (Bool, Int) {
        if isFinished(board, user) {
            return (false, 0)
        }
        if user.x == opponent.x, user.y == opponent.y {
            return (true, 1)
        }
        
        var board = board
        var win: Bool = false
        var maxTurn: Int = 0
        var minTurn: Int = Int.max
        
        for dir in dirs {
            let next = Point(y: user.y + dir[0], x: user.x + dir[1])
            
            if isIn(next) && board[next.y][next.x] == 1 {
                board[user.y][user.x] = 0
                let moveB = dfs(board, opponent, next)
                board[user.y][user.x] = 1
                
                if !moveB.0 {
                    win = true
                    minTurn = min(minTurn, moveB.1)
                } else if !win {
                    maxTurn = max(maxTurn, moveB.1)
                }
            }
        }
        return (win, (win ? minTurn : maxTurn) + 1)
    }
    
    func isIn(_ point: Point) -> Bool {
        return point.y >= 0 && point.x >= 0 && point.y < row && point.x < col
    }
    
    func isFinished(_ board: [[Int]], _ point: Point) -> Bool {
        for dir in dirs {
            let next = Point(y: point.y + dir[0], x: point.x + dir[1])
            if isIn(next) && board[next.y][next.x] == 1 {
                return false
            }
        }
        return true
    }
    
    struct Point {
        let y: Int
        let x: Int
    }
}
