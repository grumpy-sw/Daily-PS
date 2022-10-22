//
//  ColaProblem.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

import Foundation

final class ColaProblem {
    func run() {
        print(solution(3, 1, 20))
    }
    
    func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
        var result: Int = 0
        var n = n
        
        while n >= a {
            let numbers = n / a
            n -= numbers * a
            n += numbers * b
            result += numbers * b
        }
    
        return result
    }
}
