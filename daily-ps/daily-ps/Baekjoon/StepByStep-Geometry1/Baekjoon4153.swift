//
//  Baekjoon4153.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/28.
//

import Foundation

final class Baekjoon4153 {
    func run() {
        while true {
            let edges = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
            if edges[0] == 0, edges[1] == 0, edges[2] == 0 {
                break
            }
            
            if edges[2] * edges[2] == (edges[0] * edges[0] + edges[1] * edges[1]) {
                print("right")
            } else {
                print("wrong")
            }
        }
    }
}
