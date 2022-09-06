//
//  Baekjoon7568.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/06.
//

import Foundation

final class Baekjoon7568 {
    
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        var people = [Person]()
        var results = [Int]()
        
        for _ in 0..<N {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            people.append(Person(height: input[1], weight: input[0]))
        }
        
        people.forEach {
            var upperOne = 1
            
            for person in people {
                if person.height > $0.height, person.weight > $0.weight {
                    upperOne += 1
                }
            }
            results.append(upperOne)
        }
        
        results.forEach {
            print($0, terminator: " ")
        }
    }
    
    struct Person {
        let height: Int
        let weight: Int
    }
}
