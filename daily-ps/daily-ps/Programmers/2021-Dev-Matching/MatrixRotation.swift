//
//  MatrixRotation.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/21.
//

import Foundation

final class MatrixRotation {
    func run() {
        print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
    }
    
    var map: [[Int]] = []
    func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
        var result: [Int] = []
        map = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        
        for row in 0..<rows {
            for col in 0..<columns {
                map[row][col] = (columns * row) + (col + 1)
            }
        }
        
        for query in queries {
            result.append(rotate(query[0]-1, query[1]-1, query[2]-1, query[3]-1))
        }
        
        return result
    }
    
    func rotate(_ sr: Int, _ sc: Int, _ er: Int, _ ec: Int) -> Int {
        var board = map
        var movedMinimumNumber: Int = 10001
        
        // Section 1.
        for col in (sc+1)...ec {
            board[sr][col] = map[sr][col-1]
            movedMinimumNumber = min(movedMinimumNumber, board[sr][col])
        }
        
        // Section 2.
        for row in (sr+1)...er {
            board[row][ec] = map[row-1][ec]
            movedMinimumNumber = min(movedMinimumNumber, board[row][ec])
        }
        
        // Section 3.
        for col in sc...(ec-1) {
            board[er][col] = map[er][col+1]
            movedMinimumNumber = min(movedMinimumNumber, board[er][col])
        }
        
        // Section 4.
        for row in sr...(er-1) {
            board[row][sc] = map[row+1][sc]
            movedMinimumNumber = min(movedMinimumNumber, board[row][sc])
        }
        map = board
        return movedMinimumNumber
    }
}
