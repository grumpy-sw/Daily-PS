//
//  TravelRoute.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/18.
//

import Foundation

final class TravelRoute {
    func run() {
        let testCase = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
        print(solution(testCase))
    }
    
    var result: [String] = []
    func solution(_ tickets:[[String]]) -> [String] {
        var startPoints = [Int]()
        var sortedTickets = tickets.sorted(by: { before, after in
            return before[1] < after[1]
        })
        
        for index in 0..<sortedTickets.count {
            if sortedTickets[index][0] == "ICN" {
                startPoints.append(index)
            }
        }

        var visited = Array(repeating: false, count: tickets.count)

        for startPoint in startPoints {
            visited[startPoint] = true
            dfs(startPoint, sortedTickets, visited, route: [sortedTickets[startPoint][0], sortedTickets[startPoint][1]])
            visited[startPoint] = false
        }
        
        return result
    }
    
    func dfs(_ start: Int, _ tickets: [[String]], _ visited: [Bool], route: [String]) {
        let newStartPoint = tickets[start][1]
        for index in 0..<tickets.count {
            if tickets[index][0] == newStartPoint, !visited[index] {
                var visited = visited
                visited[index] = true
                dfs(index, tickets, visited, route: route + [tickets[index][1]])
                visited[index] = false
            }
        }
        if route.count == tickets.count + 1 {
            if result.isEmpty {
                result = route
            } else {
                if !compare(result, route) {
                    result = route
                }
            }
            return
        }
    }
    
    func compare(_ a1: [String], _ a2: [String]) -> Bool {
        for index in 0..<a1.count {
            if a1[index] < a2[index] {
                return true
            } else if a1[index] > a2[index] {
                return false
            }
        }
        return true
    }
}
