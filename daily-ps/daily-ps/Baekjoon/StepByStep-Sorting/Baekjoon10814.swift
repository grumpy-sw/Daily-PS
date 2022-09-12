//
//  Baekjoon10814.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/12.
//

import Foundation

final class Baekjoon10814 {
    func run() {
        let N = Int(readLine()!)!
        var members: [Member] = []
        
        for index in 0..<N {
            let information = readLine()!.split(separator: " ").map { String($0) }
            members.append(Member(age: Int(information[0])!, name: information[1], order: index))
        }
        
        let sorted = members.sorted { member1, member2 in
            if member1.age == member2.age {
                return member1.order < member2.order
            } else {
                return member1.age < member2.age
            }
        }
        
        sorted.forEach {
            print("\($0.age) \($0.name)")
        }
    }
    
    struct Member {
        let age: Int
        let name: String
        let order: Int
    }
}
