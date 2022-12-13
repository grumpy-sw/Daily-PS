//
//  Baekjoon11659.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/13.
//

import Foundation

final class Baekjoon11659 {
    func run() {
        let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
        let M = inputs[1]
        
        let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
        
        solution(M, [0] + numbers).forEach {
            print($0)
        }
    }
    
    func solution(_ m: Int, _ numbers: [Int]) -> [Int] {
        var result = [Int]()
        let sums = cumulativeSums(numbers)

        for _ in 0..<m {
            let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
            let start = inputs[0]
            let end = inputs[1]

            result.append(sums[end] - sums[start - 1])
        }
        
        return result
    }
    
    func cumulativeSums(_ numbers: [Int]) -> [Int] {
        var result = [Int]()
        var sum = 0
        for index in 0..<numbers.count {
            sum += numbers[index]
            result.append(sum)
        }
        return result
    }
}
