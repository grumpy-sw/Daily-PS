//
//  Friends4Block.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/22.
//

import Foundation

final class Friends4Block {
    func run() {
        print(solution(4, 4, ["ABBA", "ABBA", "ACCA", "ACCA"]))
    }
    
    var map: [[String]] = []
    
    func solution(_ m: Int, _ n: Int, _ board: [String]) -> Int {
        board.forEach {
            map.append(Array($0).map{ String($0) })
        }
        
        var count = 0
        while true {
            var startPointsForRemove: [Point] = []
            // 맵 전체를 조회하여 2x2를 찾아내고
            for row in 0..<(m-1) {
                for col in 0..<(n-1) {
                    if checkMatrix(at: Point(y: row, x: col)) {
                        startPointsForRemove.append(Point(y: row, x: col))
                    }
                }
            }
            // 삭제하고
            for point in startPointsForRemove {
                removeMatrix(startAt: point)
            }
            
            // 아래로 당기기
            while true {
                var isDone = true

                for row in 0..<(m-1) {
                    for col in 0..<n {
                        if map[row][col] != ".", map[row+1][col] == "." {
                            map[row+1][col] = map[row][col]
                            map[row][col] = "."
                            isDone = false
                        }
                    }
                }

                if isDone {
                    break
                }
            }
  
            if startPointsForRemove.isEmpty {
                break
            } else {
                startPointsForRemove = []
            }
        }
        
        map.forEach {
            count += $0.filter{ $0 == "." }.count
        }
        
        return count
    }
    
    func checkMatrix(at point: Point) -> Bool {
        let character = map[point.y][point.x]
        if character != "." {
            if map[point.y][point.x+1] == character, map[point.y+1][point.x] == character, map[point.y+1][point.x+1] == character {
                return true
            }
        }
        return false
    }
    
    func removeMatrix(startAt point: Point) {
        for r in 0..<2 {
            for c in 0..<2 {
                map[point.y+r][point.x+c] = "."
            }
        }
    }
    
    struct Point {
        let y: Int
        let x: Int
    }
}
