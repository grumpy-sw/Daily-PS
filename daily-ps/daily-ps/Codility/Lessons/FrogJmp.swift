//
//  FrogJmp.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/29.
//

import Foundation

final class FrogJmp {
    func run() {
        print(solution(0, 120, 30))
    }
    
    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        var count = 0
        count = (Y - X) % D == 0 ? (Y - X) / D : (Y - X) / D + 1

        return count
    }
}
