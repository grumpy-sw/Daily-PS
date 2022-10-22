//
//  InnerProduct.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 내적
import Foundation

final class InnerProduct {
    func run() {
        print(solution([1,2,3,4], [-3,-1,0,2]))
    }
    
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        var result = 0
        
        for index in 0..<a.count {
            result += (a[index] * b[index])
        }
        
        return result
    }
}
