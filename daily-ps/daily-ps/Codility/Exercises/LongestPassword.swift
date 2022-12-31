//
//  LongestPassword.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/29.
//

import Foundation

final class LongestPassword {
    func run() {
        var A = "test1"
        print(solution(&A))
    }
    
    public func solution(_ S : inout String) -> Int {
        // Implement your solution here
        let passwords = S.components(separatedBy: " ").filter{ isValid(password: $0) }.map{ $0.count }
        if passwords.isEmpty {
            return -1
        }
        return passwords.sorted().last!
    }
    
    func isValid(password: String) -> Bool {
        let passwordArray: [String] = Array(password).map{ String($0) }
        if hasOnlyAlphanumerical(passwordArray), hasEvenNumberLetters(passwordArray), hasOddNumberDigits(passwordArray) {
            return true
        }
        return false
    }
    
    func hasOnlyAlphanumerical(_ password: [String]) -> Bool {
        let characters: [String] = password.filter{
            isDigits($0) || isUppercaseCharacters($0) || isLowercaseCharacters($0)
        }
        if characters.count != password.count {
            return false
        }
        return true
    }
    
    func isDigits(_ word: String) -> Bool {
        if word >= "0", word <= "9" {
            return true
        }
        return false
    }
    
    func isLowercaseCharacters(_ word: String) -> Bool {
        if word >= "a", word <= "z" {
            return true
        }
        return false
    }
    
    func isUppercaseCharacters(_ word: String) -> Bool {
        if word >= "A", word <= "Z" {
            return true
        }
        return false
    }
    
    func hasEvenNumberLetters(_ password: [String]) -> Bool {
        let numbers = password.filter{ $0 >= "0" && $0 <= "9" }
        if (password.count - numbers.count) % 2 == 1 {
            return false
        }
        return true
    }
    
    func hasOddNumberDigits(_ password: [String]) -> Bool {
        let numbers = password.filter{ $0 >= "0" && $0 <= "9" }
        if numbers.count % 2 == 0 {
            return false
        }
        return true
    }
}
