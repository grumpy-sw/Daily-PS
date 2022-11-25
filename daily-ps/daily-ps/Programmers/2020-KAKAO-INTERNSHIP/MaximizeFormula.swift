//
//  MaximizeFormula.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/23.
//

// Level 2. 수식 최대화
import Foundation

final class MaximizeFormula {
    func run() {
        print(solution("100-200*300-500+20"))
    }
    
    let symbols = ["+", "-", "*"]
    
    // 순열
    func permutation(_ array: [String], count: Int) -> [[String]] {
        var result: [[String]] = []
        
        // Early Exit
        if count > array.count {
            return result
        }
        
        var visited: [Bool] = Array(repeating: false, count: array.count)

        func pick(_ now: [String]) {
            if now.count == count {
                result.append(now)
                return
            }
            
            for i in 0..<array.count {
                if visited[i] == false {
                    visited[i] = true
                    pick((now + [array[i]]))
                    visited[i] = false
                }
            }
        }
        
        pick([])
        
        return result
    }

    
    func solution(_ expression: String) -> Int {
        let numbers = expression.split(whereSeparator: { !$0.isNumber }).map{ String($0) }
        let opers = expression.filter{ $0 == "*" || $0 == "-" || $0 == "+" }.map{ String($0) }
        
        var expressionItems: [Item] = [Item(value: numbers[0])]
        for index in 0..<opers.count {
            expressionItems.append(Item(value: opers[index]))
            expressionItems.append(Item(value: numbers[index + 1]))
        }
        
        let containingOperators = Array(Set(opers))
        
        let operatorsWithPriority = permutation(containingOperators, count: containingOperators.count)
        var maxValue = 0

        for operators in operatorsWithPriority {
            var result = formulaResult(expressionItems, operators)
            if result < 0 {
                result *= -1
            }
            maxValue = max(maxValue, result)
        }

        return maxValue
    }
    
    func formulaResult(_ expression: [Item], _ operators: [String]) -> Int {
        var expression = expression
        var formula: [Item] = []
        for oprt in operators {
            var offset = 0
            if !formula.isEmpty {
                expression = formula
                formula = []
            }
            while offset < expression.count {
                if expression[offset].value == oprt {
                    offset += 1
                    let left = Int(formula.removeLast().value)!
                    let right = Int(expression[offset].value)!
                    let item = Item(value: String(Operator(rawValue: oprt)!.calculate(left, right)))
                    formula.append(item)
                } else {
                    formula.append(expression[offset])
                }
                offset += 1
            }
        }
        
        return Int(formula.first!.value)!
    }
    
    func calculate(_ numbers: [String], _ oper: String) -> Int {
        var numbers = numbers.map{ Int($0)! }
        var result = numbers.removeFirst()
        for number in numbers {
            result = Operator(rawValue: oper)!.calculate(result, number)
        }
        
        return result
    }
    
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case multiple = "*"
        
        func calculate(_ left: Int, _ right: Int) -> Int {
            switch self {
            case .plus:
                return left + right
            case .minus:
                return left - right
            case .multiple:
                return left * right
            }
        }
    }
    
    struct Item {
        let value: String
    }
}
