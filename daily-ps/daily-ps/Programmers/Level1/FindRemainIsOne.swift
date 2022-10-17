//
//  FindRemainIsOne.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/15.
//

import Foundation

final class FindRemainIsOne {
    func run() {
        print(solution(12))
    }
    
    func solution(_ n: Int) -> Int {
        for number in 2..<n {
            if n % number == 1 {
                return number
            }
        }
        return 0
    }
}
