//
//  Baekjoon10757.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon10757 {
    func run() {
        solution()
    }
    
    func solution() {
        var result: [String] = []
        let numbers = readLine()!.split(separator: " ").map { Array(String($0)).map { String($0) } }
        var shortOne: [String] = []
        var longOne: [String] = []
        var carry = 0
        
        if numbers[0].count >= numbers[1].count {
            longOne = numbers[0]
            shortOne = numbers[1]
        } else {
            shortOne = numbers[0]
            longOne = numbers[1]
        }
        
        while !shortOne.isEmpty {
            let a = Int(shortOne.removeLast())!
            let b = Int(longOne.removeLast())!
            var sum = a + b + carry
            carry = 0
            if sum > 9 {
                carry = 1
                sum -= 10
            }
            result = [String(sum)] + result
        }
        
        while !longOne.isEmpty {
            let a = Int(longOne.removeLast())!
            var sum = a + carry
            carry = 0
            if sum > 9 {
                carry = 1
                sum -= 10
            }
            result = [String(sum)] + result
        }
        
        if carry != 0 {
            result = [String(carry)] + result
        }
        
        print(result.joined())
    }
}
