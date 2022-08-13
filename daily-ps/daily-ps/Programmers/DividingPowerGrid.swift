//
//  DividingPowerGrid.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/12.
//

import Foundation

final class DividingPowerGrid {
    func run() {
        print(solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]))
    }
    
    func solution(_ n: Int, _ wires: [[Int]]) -> Int {
        var points: [Point] = [Point(number: 0, edges: [])]

        for index in 1..<(n+1) {
            points.append(Point(number: index, edges: []))
        }
        
        for wire in wires {
            points[wire[0]].edges.append(wire[1])
            points[wire[1]].edges.append(wire[0])
        }
        
        //let startPoint = points.sorted { before, after in
        //    return before.edges.count > after.edges.count
        //}.first!
        var min: Int = Int.max
        for num in 1...n {
            let startPoint = points[num]
            for index in 0..<startPoint.edges.count {
                var tree = points
                let destination = tree[startPoint.number].edges.remove(at: index)
                tree[destination].edges.remove(at: tree[destination].edges.firstIndex(of: startPoint.number)!)
                let number = calculatePowerGrid(tree[startPoint.number], tree)
                let result = abs(number - (n - number))
                
                if result < min {
                    min = result
                }
            }
        }
        
        
        
        
        return min
    }
    
    func calculatePowerGrid(_ start: Point, _ points: [Point]) -> Int {
        var visited = Array(repeating: false, count: (points.count + 1))
        var queue: [Point] = [start]
        visited[start.number] = true
        var number: Int = 1
        while !queue.isEmpty {
            let front = queue.removeFirst()
            for edge in front.edges {
                if !visited[edge] {
                    number += 1
                    visited[edge] = true
                    queue.append(points[edge])
                }
            }
        }
        return number
    }
}

struct Point {
    let number: Int
    var edges: [Int]
}
