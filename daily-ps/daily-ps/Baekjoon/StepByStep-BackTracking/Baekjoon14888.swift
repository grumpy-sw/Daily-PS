//
//  Baekjoon14888.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/30.
//

import Foundation

final class Baekjoon14888 {
    
    var MAX = -1000000000
    var MIN = 1000000000
    var N: Int = 0
    var numbers: [Int] = []
    var op: [Int] = []
    func run() {
        N = Int(readLine()!)!
        numbers = readLine()!.split(separator: " ").map { Int($0)! }
        op = readLine()!.split(separator: " ").map { Int($0)! }
        
        solution(numbers[0], 1)
        
        print(MAX)
        print(MIN)
    }
    
    func solution(_ number: Int, _ offset: Int) {
        if offset == N {
            MAX = max(MAX, number)
            MIN = min(MIN, number)
            return
        }
        
        for index in 0..<4 {
            if op[index] <= 0 {
                continue
            }
            op[index] -= 1
            
            switch index {
            case 0:
                solution(number + numbers[offset], offset + 1)
                break
            case 1:
                solution(number - numbers[offset], offset + 1)
                break
            case 2:
                solution(number * numbers[offset], offset + 1)
                break
            case 3:
                solution(number / numbers[offset], offset + 1)
                break
            default:
                break
            }
            op[index] += 1
        }
    }
}
