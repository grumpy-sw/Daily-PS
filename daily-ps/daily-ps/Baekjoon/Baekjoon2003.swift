//
//  Baekjoon2003.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/07.
//

import Foundation

final class Baekjoon2003 {
    var result: Int = 0
    func run() {
        solution()
    }
    
    func solution() {
        let target: Int = Int(readLine()!.split(separator: " ")[1])!
        let numbers: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
        
            dfs(numbers, target, 0, 0)
        
        print(result)
    }
    
    func dfs(_ numbers: [Int], _ target: Int, _ start: Int, _ end: Int) {
        if start >= numbers.count || end >= numbers.count {
            return
        }
        
        if numbers[start] > target {
            dfs(numbers, target, start+1, start+1)
            return
        }
        
        let sum = numbers[start...end].reduce(0, +)
        if sum == target {
            result += 1
            print("# \(start), \(end)")
            dfs(numbers, target, start+1, start+1)
        } else if sum > target {
            dfs(numbers, target, start+1, start+1)
        } else {
            dfs(numbers, target, start, end+1)
        }
    }
}
