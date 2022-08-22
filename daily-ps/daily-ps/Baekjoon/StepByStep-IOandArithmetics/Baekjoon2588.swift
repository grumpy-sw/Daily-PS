//
//  Baekjoon2588.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon2588 {
    func run() {
        solution()
    }
    
    func solution() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        
        let bUnitArray: [Int] = [b / 100, (b % 100) / 10, b % 10]
        
        print(a * bUnitArray[2])
        print(a * bUnitArray[1])
        print(a * bUnitArray[0])
        print(a * b)
    }
}
