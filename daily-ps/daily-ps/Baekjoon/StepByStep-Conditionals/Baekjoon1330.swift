//
//  Baekjoon1330.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/22.
//

import Foundation

final class Baekjoon1330 {
    func run() {
        solution()
    }
    
    func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        if numbers[0] == numbers[1] {
            print("==")
        } else if numbers[0] > numbers[1] {
            print(">")
        } else {
            print("<")
        }
    }
}
