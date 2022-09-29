//
//  Baekjoon14889.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/29.
//

import Foundation

final class Baekjoon14889 {
    var N: Int = 0
    var map: [[Int]] = []
    
    func run() {
        N = Int(readLine()!)!
        for _ in 0..<N {
            map.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        var numberPool: [Int] = []
        
        for number in 0..<N {
            numberPool.append(number)
        }
        let startTeams = combination(numberPool, count: N/2)
        var minDiff = Int.max
        
        startTeams.forEach {
            let startTeam = $0
            let linkTeam = numberPool.filter{ !startTeam.contains($0) }
            
            let s = teamPower(startTeam)
            let l = teamPower(linkTeam)
            
            minDiff = min(minDiff, abs(s - l))
        }
        print(minDiff)
    }
    
    
    func combination(_ array: [Int], count: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func pick(_ now: [Int], offset: Int) {
            if now.count == count {
                result.append(now)
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index+1)
            }
        }
        
        pick([], offset: 0)
        return result
    }
    
    func teamPower(_ teams: [Int]) -> Int {
        var power = 0
        
        for player in teams {
            for companion in teams {
                power += map[player][companion]
            }
        }
        
        return power
    }
}
