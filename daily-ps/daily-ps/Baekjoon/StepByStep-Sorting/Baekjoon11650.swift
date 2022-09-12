//
//  Baekjoon11650.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/12.
//

import Foundation

final class Baekjoon11650 {
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        var points: [Point] = []
        
        for _ in 0..<N {
            let coordinate = readLine()!.split(separator: " ").map{ Int($0)! }
            points.append(Point(x: coordinate[0], y: coordinate[1]))
        }
        
        let result = points.sorted { p1, p2 in
            if p1.x == p2.x {
                return p1.y < p2.y
            } else {
                return p1.x < p2.x
            }
        }
        
        result.forEach {
            print("\($0.x) \($0.y)")
        }
    }
    
    struct Point {
        let x: Int
        let y: Int
    }
}
