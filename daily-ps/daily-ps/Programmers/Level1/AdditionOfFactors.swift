//
//  AdditionOfFactors.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/22.
//

// Level 1. 약수의 개수와 덧셈
import Foundation

final class AdditionOfFactors {
    func run() {
        print(solution(13, 17))
    }
    
    func solution(_ left:Int, _ right:Int) -> Int {
        var sum = 0
        for number in left...right {
            sum += numberForSum(number)
        }
        
        return sum
    }
    
    func numberForSum(_ number: Int) -> Int {
        let sqroot: Int = Int(sqrt(Double(number)))
        if sqroot * sqroot == number {
            return -number
        } else {
            return number
        }
    }
}
