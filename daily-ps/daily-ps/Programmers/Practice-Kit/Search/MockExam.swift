//
//  MockExam.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/11.
//

import Foundation

final class MockExam {
    func run() {
        print(solution([1, 3, 2, 4, 2]))
    }
    
    func solution(_ answers:[Int]) -> [Int] {
        let one = Student(name: 1, type: .one)
        let two = Student(name: 2, type: .two)
        let three = Student(name: 3, type: .three)
        
        let array = [one, two, three]
        
        for index in 0..<answers.count {
            let correctAnswer = answers[index]
            
            array.forEach {
                if $0.type.answerSheet[index % ($0.type.answerSheet.count)] == correctAnswer {
                    $0.score += 1.0
                }
            }
        }
        
        return maxScoreStudents(one, two, three)
    }

    func maxScoreStudents(_ one: Student, _ two: Student, _ three: Student) -> [Int] {
        let max = maxScore(one.score, two.score, three.score)
        var result = [Int]()
        
        [one, two, three].forEach {
            let score = $0.score
            if max == score {
                result.append($0.name)
            }
        }
        
        return result
    }

    func maxScore(_ num1: Double, _ num2: Double, _ num3: Double) -> Double {
         if num2 <= num1, num3 <= num1 {
            return num1
         } else if num1 <= num2, num3 <= num2 {
             return num2
         } else {
             return num3
         }
    }

    enum Supoja {
        case one
        case two
        case three
        
        var answerSheet: [Int] {
            switch self {
                case .one:
                return [1, 2, 3, 4, 5]
                case .two:
                return [2, 1, 2, 3, 2, 4, 2, 5]
                case .three:
                return [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
            }
        }
    }

    final class Student {
        var name: Int
        var score: Double = 0
        var type: Supoja
        
        init(name: Int, type: Supoja) {
            self.name = name
            self.type = type
        }
    }
}
