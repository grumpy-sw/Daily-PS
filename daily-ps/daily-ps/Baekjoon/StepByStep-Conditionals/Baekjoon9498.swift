//
//  Baekjoon9498.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon9498 {
    func run() {
        solution()
    }
    
    func solution() {
        let score = Int(readLine()!)!
        
        if score >= 90 {
            print("A")
        } else if score >= 80 {
            print("B")
        } else if score >= 70 {
            print("C")
        } else if score >= 60 {
            print("D")
        } else {
            print("F")
        }
    }
}
