//
//  DiscountEvent.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/19.
//

// Level 2. 할인 행사
import Foundation

final class DiscountEvent {
    func run() {
        print(solution(
            ["apple"],
            [10],
            ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]
        )
        )
    }
    
    func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
        
        var answer: Int = 0
        var shoppingList: [String: Int] = [:]
        
        for index in 0..<want.count {
            shoppingList[want[index]] = number[index]
        }
        
        for day in 0...discount.count - 10 {
            let discountList = makeDiscountList(shoppingList, Array(discount[day..<day+10]))
            if checkTwoLists(shoppingList, discountList) {
                answer += 1
            }
        }
        
        return answer
    }
    
    func makeDiscountList(_ shoppingList: [String: Int], _ discount: [String]) -> [String: Int] {
        var discountList: [String: Int] = [:]
        for index in 0..<discount.count {
            discountList[discount[index]] = (discountList[discount[index]] ?? 0) + 1
        }
        return discountList
    }
    
    func checkTwoLists(_ shoppingList: [String: Int], _ discountList: [String: Int]) -> Bool {
        for itemName in shoppingList.keys {
            if shoppingList[itemName] != discountList[itemName] {
                return false
            }
        }
        return true
    }
}
