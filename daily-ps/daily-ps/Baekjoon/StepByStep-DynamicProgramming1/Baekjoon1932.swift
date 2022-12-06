//
//  Baekjoon1932.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/06.
//

import Foundation

final class Baekjoon1932 {
    func run() {
        let n = Int(readLine()!)!
        var numbers: [[Int]] = []
        
        for _ in 0..<n {
            numbers.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        print(solution(n, numbers))
    }
    
    func solution(_ n: Int, _ numbers: [[Int]]) -> Int {
        var answers: [[Int]] = [numbers[0]]
        
        for count in 1..<n {
            var answer = Array(repeating: 0, count: count+1)
            let lastAnswer = answers.last!
            
            answer[0] = lastAnswer[0] + numbers[count][0]
            answer[count] = lastAnswer.last! + numbers[count].last!
            
            for index in 1..<count {
                answer[index] = max(lastAnswer[index - 1], lastAnswer[index]) + numbers[count][index]
            }
            answers.append(answer)
        }
        return maxValue(of: answers.last!)
    }
    
    func maxValue(of array: [Int]) -> Int {
        var result = array[0]
        
        for index in 1..<array.count {
            result = max(result, array[index])
        }
        return result
    }
}
