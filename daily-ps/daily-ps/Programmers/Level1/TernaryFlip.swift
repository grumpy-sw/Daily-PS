//
//  TernaryFlip.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 월간 코드 챌린지 시즌 1. 3진법 뒤집기
import Foundation

final class TernaryFlip {
    func run() {
        print(solution(45))
    }
    
    func solution(_ n:Int) -> Int {
        let ternaryNumber = Array(String(n, radix: 3, uppercase: false)).map{ String($0) }
        let flippedNumber: String = ternaryNumber.reversed().joined()
        
        return Int(flippedNumber, radix: 3)!
    }
}
