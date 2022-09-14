//
//  UndestroyedBuilding.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/14.
//

import Foundation

final class UndestroyedBuilding {
    func run() {
        print(solution([[1,2,3],[4,5,6],[7,8,9]],
                       [[1,1,1,2,2,4], [1,0,0,1,1,2], [2,2,0,2,0,100]]))
    }
    
    var map: [[Int]] = []
    var count = 0
    
    func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
        map = Array(repeating: Array(repeating: 0, count: board[0].count+1), count: board.count+1)
        var board = board
        for s in skill {
            let type = s[0]
            var damage = 0
            if type == 1 {
                damage = s[5] * -1
            } else {
                damage = s[5]
            }
            fillTheMap(Point(r: s[1], c: s[2]), Point(r: s[3], c: s[4]), damage)
        }
        addVertically()
        addHorizontally()
        
        
        board = adjustBoard(&board)

        return count
    }

    func fillTheMap(_ start: Point, _ end: Point, _ damage: Int) {
        map[start.r][start.c] += damage
        map[end.r+1][end.c+1] += damage
        
        map[start.r][end.c+1] -= damage
        map[end.r+1][start.c] -= damage
    }
    
    func addVertically() {
        for r in 1..<map.count {
            for c in 0..<map[0].count {
                map[r][c] += map[r-1][c]
            }
        }
    }

    func addHorizontally() {
        for r in 0..<map.count {
            for c in 1..<map[0].count {
                map[r][c] += map[r][c-1]
            }
        }
    }

    func adjustBoard(_ board: inout [[Int]]) -> [[Int]] {
        for r in 0..<board.count {
            for c in 0..<board.count {
                board[r][c] += map[r][c]
                if board[r][c] > 0 {
                    count += 1
                }
            }
        }
        return board
    }
    
    struct Point {
        let r: Int
        let c: Int
    }
}
