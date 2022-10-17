//
//  NumberPair.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/15.
//

import Foundation

final class NumberPair {
    func run() {
        print(solution("00", "00"))
    }
    
    func solution(_ X:String, _ Y:String) -> String {
        
        let xArr = Array(X).map{ String($0) }
        let yArr = Array(Y).map{ String($0) }
        var result: String = ""
        
        var numbersOfNumberX: [Int] = Array(repeating: 0, count: 10)
        var numbersOfNumberY: [Int] = Array(repeating: 0, count: 10)
        
        xArr.forEach {
            let number = Int($0)!
            numbersOfNumberX[number] += 1
        }
        
        yArr.forEach {
            let number = Int($0)!
            numbersOfNumberY[number] += 1
        }
        
        
        for i in 0...9 {
            let index = 9 - i
            guard numbersOfNumberX[index] != 0, numbersOfNumberY[index] != 0 else {
                continue
            }
            if index == 0, result.isEmpty {
                result = "0"
            } else {
                let count = min(numbersOfNumberX[index], numbersOfNumberY[index])
                result += Array(repeating: index, count: count).map{ String($0) }.joined()
            }
        }
        
        if result.isEmpty {
            return "-1"
        } else {
            return result
        }
    }
    
    
}
