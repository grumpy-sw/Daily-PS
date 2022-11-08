//
//  Delivery.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/01.
//

import Foundation

final class Delivery {
    func run() {
        print(solution(
            6,
            [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]],
            4)
        )
    }
    
    var map: [[Int]] = []
    var route: [Int] = []
    var visited: [Bool] = []
    
    func solution(_ N: Int, _ road: [[Int]], _ k: Int) -> Int {
        var answer = 0
        
        map = Array(repeating: Array(repeating: 10001, count: N), count: N)
        visited = Array(repeating: false, count: N)
        
        for road in road {
            let start = road[0]
            let end = road[1]
            let cost = min(map[start - 1][end - 1], road[2])
            
            map[start - 1][end - 1] = cost
            map[end - 1][start - 1] = cost
        }
        
        for index in 0..<map.count {
            map[index][index] = 0
        }
        
        print(map)
        route = map[0]
        visited[0] = true
        //dijkstra(0)
        
        return deliveriableCount(k)
    }
    
    func dijkstra(_ index: Int) {
        for dest in 0..<route.count {
            route[dest] = min(route[dest], route[index] + map[index][dest])
        }
        
        if visited.filter({ $0 == false }).isEmpty {
            return
        }
        
        let target = minimumCostIndex()
        visited[target] = true
        dijkstra(target)
    }
    
    func minimumCostIndex() -> Int {
        var minimumValue: Int = 500001
        var indexOfMinimumValue: Int = 0
        
        for index in 0..<visited.count {
            if !visited[index] {
                if route[index] < minimumValue {
                    minimumValue = route[index]
                    indexOfMinimumValue = index
                }
            }
        }
        
        return indexOfMinimumValue
    }
    
    func deliveriableCount(_ k: Int) -> Int {
        return route.filter { $0 <= k }.count
    }
}
