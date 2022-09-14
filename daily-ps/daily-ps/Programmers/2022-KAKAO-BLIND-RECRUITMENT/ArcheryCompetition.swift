//
//  ArcheryCompetition.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/13.
//

import Foundation

final class ArcheryCompetition {
    func run() {
        print(solution(10, [1,1,1,1,1,1,1,1,1,1,0]))
    }
    
    var maxGap: Int = 0
    var winningHistory: [[Int]] = []
    
    func solution(_ n:Int, _ info:[Int]) -> [Int] {
        var result: [Int] = []
        
        dfs(0, n, info.reversed(), Array(repeating: 0, count: 11))
        
        if winningHistory.isEmpty {
            return [-1]
        } else {
            result = sortByLowerScore(winningHistory).first!.reversed()
        }
        
        return result
    }
    
    // num: 맞출 숫자 count: 화살의 남은 개수
    func dfs(_ num: Int, _ count: Int, _ info: [Int], _ history: [Int]) {
        if count == 0 || num > 10 {
            var history = history
            
            if count > 0 {
                history[0] += count
            }
            let gap = calculateScoreGap(info, history)
            if gap <= 0 {
                return
            }
            else if gap > maxGap {
                maxGap = gap
                winningHistory = [history]
            } else if gap == maxGap {
                winningHistory.append(history)
            }
            return
        }
        
        let requiredShoot = info[num] + 1
        if count >= requiredShoot {
            var history = history
            history[num] = requiredShoot
            dfs(num + 1, count - requiredShoot, info, history)
        }
        dfs(num + 1, count, info, history)
    }
    
    func calculateScoreGap(_ info: [Int], _ history: [Int]) -> Int {
        var ryan: Int = 0
        var apeach: Int = 0
        for index in 0..<history.count {
            if history[index] == 0 {
                apeach += (info[index] > 0 ? index : 0)
            } else {
                ryan += index
            }
        }
        
        return ryan - apeach
    }
    
    func sortByLowerScore(_ history: [[Int]]) -> [[Int]] {
        return history.sorted { h1, h2 in
            h1.filter { $0 != 0 }.count > h2.filter { $0 != 0 }.count
        }
    }
}
