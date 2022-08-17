//
//  FatigueLevel.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/18.
//

import Foundation

final class FatigueLevel {
    func run() {
        print(solution(80, [[80,20],[50,40],[30,10]]))
    }
    
    var maxDungeons = 0
    func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        let visited = Array(repeating: false, count: dungeons.count)
        dfs(k, dungeons, visited)
        return maxDungeons
    }
    
    func dfs(_ stamina: Int, _ dungeons:[[Int]], _ visited: [Bool]) {
        var visited = visited
        for index in 0..<dungeons.count {
            let dungeon = dungeons[index]
            if !visited[index], stamina >= dungeon[0], canEndure(stamina - dungeon[1]) {
                visited[index] = true
                dfs(stamina - dungeon[1], dungeons, visited)
                visited[index] = false
            }
        }
        
        let count = visited.filter {
            $0 == true
        }.count
        
        if count > maxDungeons {
            maxDungeons = count
        }
    }
    
    func canEndure(_ k: Int) -> Bool {
        return k > 0
    }
}
