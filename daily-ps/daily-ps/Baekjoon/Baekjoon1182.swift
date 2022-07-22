//
//  Baekjoon1182.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/23.
//

import Foundation

final class Baekjoon1182 {
    func run() {
        let input: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
        
        let n: Int = input[0]   // 숫자 배열의 길이
        let s: Int = input[1]   // 부분수열의 합
        
        let numbers: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var result:Int = 0
        
        for length in 1...n {
            let subsequence = combination(numbers, count: length)
            subsequence.forEach {
                let sum = $0.reduce(0, +)
                if sum == s {
                    result += 1
                }
            }
        }
        print(result)
    }
    
    func combination(_ array: [Int], count: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        if array.count < count {
            return result
        }
        pick([], offset: 0)
        
        func pick(_ now: [Int], offset: Int) {
            if now.count == count {
                result.append(now)
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index+1)
            }
        }
        return result
    }
}
