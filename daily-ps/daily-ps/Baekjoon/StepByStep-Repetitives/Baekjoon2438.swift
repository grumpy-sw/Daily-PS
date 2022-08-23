//
//  Baekjoon2438.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon2438 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        
        for count in 1...n {
            for _ in 1...count {
                print("*", terminator: "")
            }
            print("")
        }
    }
}
