//
//  YinAndYang.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/15.
//

import Foundation

final class YinAndYang {
    func run() {
        print(solution([1,2,3], [false,false,true]))
    }
    
    func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
        
        var sum: Int = 0
        
        for index in 0..<signs.count {
            
            if signs[index] {
                sum += absolutes[index]
            } else {
                sum -= absolutes[index]
            }
        }
        
        return sum
    }
}
