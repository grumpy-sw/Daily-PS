//
//  TennisTournament.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/30.
//

import Foundation

final class TennisTournament {
    func run() {
        print(solution(1, 1))
    }
    
    public func solution(_ P : Int, _ C : Int) -> Int {
        // Implement your solution here
        return min(P/2, C)
    }
}
