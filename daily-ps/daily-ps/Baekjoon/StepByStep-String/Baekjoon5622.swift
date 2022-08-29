//
//  Baekjoon5622.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon5622 {
    func run() {
        solution()
    }
    
    func solution() {
        let input = Array(readLine()!).map{ String($0) }
        var sum = 0
        for char in input {
            let dial = Dial(rawValue: char)
            sum += dial?.value ?? 0
        }
        
        print(sum)
    }
    
    enum Dial: String {
        case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P
        case Q, R, S, T, U, V, W, X, Y, Z
        
        var value: Int {
            switch self {
            case .A, .B, .C:
                return 3
            case .D, .E, .F:
                return 4
            case .G, .H, .I:
                return 5
            case .J, .K, .L:
                return 6
            case .M, .N, .O:
                return 7
            case .P, .Q, .R, .S:
                return 8
            case .T, .U, .V:
                return 9
            case .W, .X, .Y, .Z:
                return 10
            }
        }
    }
}
