//
//  Personality.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/20.
//

// Level 1. 성격 유형 검사하기

import Foundation

final class Personality {
    func run() {
        print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
    }
    
    /*
     1    매우 비동의    -3
     2    비동의        -2
     3    약간 비동의    -1
     4    모르겠음       0
     5    약간 동의      1
     6    동의          2
     7    매우 동의      3
     */
    
    func solution(_ survey:[String], _ choices:[Int]) -> String {
        var R = 0, T = 0, C = 0, F = 0, J = 0, M = 0, A = 0, N = 0
        
        for index in 0..<survey.count {
            let topic: String
            let score: Int
            if choices[index] > 4 {
                // 동의
                topic = Array(survey[index]).map{ String($0) }[1]
                score = (choices[index] - 4)
            } else {
                // 비동의
                topic = Array(survey[index]).map{ String($0) }[0]
                score = (4 - choices[index])
            }
            if topic == "R" {
                R += score
            } else if topic == "T" {
                T += score
            } else if topic == "C" {
                C += score
            } else if topic == "F" {
                F += score
            } else if topic == "J" {
                J += score
            } else if topic == "M" {
                M += score
            } else if topic == "A" {
                A += score
            } else if topic == "N" {
                N += score
            }
        }
        var result: [String] = []
        
        R >= T ? result.append("R") : result.append("T")
        C >= F ? result.append("C") : result.append("F")
        J >= M ? result.append("J") : result.append("M")
        A >= N ? result.append("A") : result.append("N")
        return result.joined()
    }
}
