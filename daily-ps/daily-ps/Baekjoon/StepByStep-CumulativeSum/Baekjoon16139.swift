//
//  Baekjoon16139.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/14.
//

import Foundation

final class Baekjoon16139 {
    func run() {
        let word = Array(readLine()!).map{ String($0) }
        solution(word).forEach {
            print($0)
        }
    }
    
    func solution(_ word: [String]) -> [Int] {
        let alpabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        var sums = [String: [Int]]()
        
        for alpabet in alpabets {
            sums[alpabet] = cumulativeSum(alpabet, from: word)
        }
        
        let n = Int(readLine()!)!
        var result = [Int]()
        for _ in 0..<n {
            let inputs = readLine()!.split(separator: " ")
            let sum = sums[String(inputs[0])]!
            let start = Int(inputs[1])!
            let end = Int(inputs[2])!

            if start == 0 {
                result.append(sum[end])
            } else {
                result.append(sum[end] - sum[start - 1])
            }
        }
        return result
    }
    
    func cumulativeSum(_ target: String, from word: [String]) -> [Int] {
        var sums = [Int]()
        var sum = 0
        
        for str in word {
            if str == target {
                sum += 1
            }
            sums.append(sum)
        }
        return sums
    }
}
