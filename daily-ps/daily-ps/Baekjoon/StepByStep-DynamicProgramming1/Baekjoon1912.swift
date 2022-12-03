//
//  Baekjoon1912.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/03.
//

import Foundation

final class Baekjoon1912 {
    func run() {
        let n = Int(readLine()!)!
        let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
        print(solution(n, numbers))
    }
    
    func solution(_ n: Int, _ numbers: [Int]) -> Int {
        var sums: [Int] = [numbers[0]]
        
        for index in 1..<n {
            let sum = max(numbers[index], numbers[index] + sums[index - 1])
            sums.append(sum)
        }
        
        return sums.max()!
    }
}
