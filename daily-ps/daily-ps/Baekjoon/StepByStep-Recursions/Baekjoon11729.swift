//
//  Baekjoon11729.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/05.
//

import Foundation

final class Baekjoon11729 {
    
    var path: [String] = []
    
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        hanoi(N, 1, 3, 2)
        
        print(path.count)
        path.forEach {
            print($0)
        }
    }
    
    func hanoi(_ n: Int, _ start: Int, _ to: Int, _ via: Int) {
        if n == 1 {
            move(1, start, to)
        } else {
            hanoi(n-1, start, via, to)
            move(n, start, to)
            hanoi(n-1, via, to, start)
        }
    }
    
    func move(_ n: Int, _ from: Int, _ to: Int) {
        path.append("\(from) \(to)")
    }
}
