//
//  Baekjoon3009.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/27.
//

import Foundation

final class Baekjoon3009 {
    func run() {
        var xs: [Int] = []
        var ys: [Int] = []
        for _ in 0..<3 {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            xs.append(input[0])
            ys.append(input[1])
        }
        print("\(find(xs.sorted())) \(find(ys.sorted()))")
    }
    
    func find(_ xs: [Int]) -> Int {
        var stack: [Int] = xs
        while !stack.isEmpty {
            let s = stack.removeLast()
            guard let l = stack.last else {
                return s
            }
            if s == l {
                stack.removeLast()
            } else {
                return s
            }
        }
        
        return 0
    }
}
