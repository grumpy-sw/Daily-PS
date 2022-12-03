//
//  ExpectedMatches.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/03.
//

import Foundation

final class ExpectedMatches {
    func run() {
        print(solution(8, 4, 5))    // 3
    }
    
    func solution(_ n: Int, _ a: Int, _ b: Int) -> Int {
        var answer = 1
        var aPos = [a-1]
        var bPos = [b-1]
        var n = n
        while n > 2 {
            n /= 2
            aPos.append(aPos.last! / 2)
            bPos.append(bPos.last! / 2)
        }
        
        for index in 0..<aPos.count {
            if (aPos[index] % 2 == 0 && bPos[index] - aPos[index] == 1) || (bPos[index] % 2 == 0 && aPos[index] - bPos[index] == 1) {
                answer += index
                break
            }
        }
        
        
        return answer
    }
}
