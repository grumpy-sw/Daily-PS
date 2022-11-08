//
//  VisitingLength.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/08.
//

import Foundation

final class VisitingLength {

    func run() {
        print(solution("LULLLLLLU"))
    }
    
    func solution(_ dirs:String) -> Int {
        var point = Point(r: 5, c: 5)
        let dirs = Array(dirs).map{ String($0) }
        var visited: [[Point]] = []
        
        for dir in dirs {
            let direction = Direction(rawValue: dir)!
            let next = Point(r: point.r + direction.move[0], c: point.c + direction.move[1])
            if isIn(next) {
                visited.append([point, next])
                visited.append([next, point])
                point = next
            }
        }
        return Set(visited).count / 2
    }
    
    func isIn(_ point: Point) -> Bool {
        return point.r >= 0 && point.c >= 0 && point.r < 11 && point.c < 11
    }
    
    struct Point: Hashable {
        var r: Int
        var c: Int
    }
    
    enum Direction: String {
        case up = "U"
        case down = "D"
        case left = "L"
        case right = "R"
        
        var move: [Int] {
            switch self {
            case .up:
                return [-1, 0]
            case .down:
                return [1, 0]
            case .left:
                return [0, -1]
            case .right:
                return [0, 1]
            }
        }
    }
}
