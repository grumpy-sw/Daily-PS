//
//  NumberGame.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/02.
//

import Foundation

final class NumberGame {
    func run() {
        print(solution(16, 16, 2, 1))
    }
    
    func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
        var answers: [String] = ["-1"]
        var result: [String] = []
        let max = m * t
        
//        for number in 0..<max {
//            answers += Array(String(number, radix: n, uppercase: true)).map{ String($0) }
//        }
        
        var number = 0
        while answers.count < max {
            answers += Array(String(number, radix: n, uppercase: true)).map{ String($0) }
            number += 1
        }
        
        var index = p
        while result.count < t {
            result.append(answers[index])
            index += m
        }
        
        return result.joined()
    }
}
