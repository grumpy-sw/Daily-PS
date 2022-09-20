//
//  Baekjoon1269.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/20.
//

import Foundation

final class Baekjoon1269 {
    func run() {
        _ = readLine()
        let A = readLine()!.split(separator: " ").map{ Int($0)! }
        let B = readLine()!.split(separator: " ").map{ Int($0)! }
        let A_B = Set(A).subtracting(Set(B))
        let B_A = Set(B).subtracting(Set(A))
        print(B_A.count + A_B.count)
    }
}
