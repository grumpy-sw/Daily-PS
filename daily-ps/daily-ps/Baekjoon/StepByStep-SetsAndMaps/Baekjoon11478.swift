//
//  Baekjoon11478.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/20.
//

import Foundation

final class Baekjoon11478 {
    func run() {
        let str = Array(readLine()!).map{ String($0) }
        var subsets: Set<String> = Set()
        
        for offset in 0..<str.count {
            var subset = ""
            for index in offset..<str.count {
                subset += str[index]
                subsets.update(with: subset)
            }
        }
        
        print(subsets.count)
    }
}
