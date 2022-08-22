//
//  Baekjoon14681.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon14681 {
    func run() {
        solution()
    }
    
    func solution() {
        let x = Int(readLine()!)!
        let y = Int(readLine()!)!
        
        if x > 0, y > 0 {
            print("1")
        } else if x < 0, y > 0 {
            print("2")
        } else if x < 0, y < 0 {
            print("3")
        } else {
            print("4")
        }
    }
}
