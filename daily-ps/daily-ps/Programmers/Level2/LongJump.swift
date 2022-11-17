//
//  LongJump.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/17.
//

// Level 2. 멀리 뛰기
import Foundation

final class LongJump {
    func run() {
        print(solution(4)) // 5
    }
    
    func solution(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: 2001)
        dp[1] = 1
        dp[2] = 2
        
        if n == 1 || n == 2 {
            return dp[n]
        }
        
        for offset in 3...n {
            dp[offset] = (dp[offset - 1] + dp[offset - 2]) % 1234567
        }
        return dp[n]
    }
    
//    let steps: [Int] = [1, 2]
//    var results: Int = 0
//    var N: Int = 0
//
//    func solution(_ n:Int) -> Int {
//        N = n
//        dfs(0)
//
//        print(results % 1234567)
//        return 0
//    }
//
//    func dfs(_ current: Int) {
//        if current >= N {
//            if current == N {
//                results += 1
//            }
//            return
//        }
//
//        for step in steps {
//            dfs(current + step)
//        }
//    }
}
