//
//  2022.08.03
//  프로그래머스 코딩테스트 고득점 Kit - 해시
//
//  Level 2. 위장
//

import Foundation

final class Disguise {
    func run() {
        print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])) // 5
    }
    
    func solution(_ clothes:[[String]]) -> Int {
        var answer = 1
        let clothesDictionary = setClothesDictionary(clothes)
        
        for clothes in clothesDictionary.values {
            answer *= (clothes + 1)
        }
        
        return answer - 1
    }
    
    func setClothesDictionary(_ clothes: [[String]]) -> [String: Int] {
        var clothesDictionary: [String: Int] = [:]
        for index in 0..<clothes.count {
            let lastValue: Int = clothesDictionary[clothes[index][1]] ?? 0
            clothesDictionary.updateValue(lastValue + 1, forKey: clothes[index][1])
        }
        return clothesDictionary
    }
}
