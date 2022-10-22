//
//  CalculateShortfall.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 위클리 챌린지. 부족한 금액 계산하기
import Foundation

final class CalculateShortfall {
    func run() {
        print(solution(3, 20, 4))
    }
    
    func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
        var answer: Int64 = 0
        var charge: Int64 = 0
        
        for chance in 1...count {
            charge += Int64(price * chance)
        }
        
        if charge > money {
            return charge - Int64(money)
        } else {
            return 0
        }
    }
}
