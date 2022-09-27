//
//  Baekjoon1085.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/27.
//

import Foundation

final class Baekjoon1085 {
    func run() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let X = input[0]
        let Y = input[1]
        let w = input[2]
        let h = input[3]
        
        var minLength = 1001
        
        minLength = min(minLength, X)
        minLength = min(minLength, w - X)
        minLength = min(minLength, Y)
        minLength = min(minLength, h - Y)
        
        print(minLength)
    }
}
