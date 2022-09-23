//
//  IdRecommandation.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/23.
//

import Foundation

final class IdRecommandation {
    func run() {
        print(solution("abcdefghijklmn.p"))
    }
    
    let specialCharacters: [String] = ["-", "_", "."]
    func solution(_ new_id:String) -> String {
        var id = new_id
        id = id.lowercased()
        
        var idtoArray = Array(id).map{ String($0) }
        idtoArray = idtoArray.filter {
            (Int(UnicodeScalar($0)!.value) >= 97 && Int(UnicodeScalar($0)!.value) <= 122)
            || (Int(UnicodeScalar($0)!.value) >= 48 && Int(UnicodeScalar($0)!.value) <= 57)
            || specialCharacters.contains($0)
        }
        
        id = idtoArray.joined().replacingOccurrences(of: "\\.+", with: ".", options: .regularExpression)
        
        idtoArray = Array(id).map { String($0) }
        if idtoArray.last == "." {
            idtoArray.removeLast()
        }
        
        if idtoArray.first == "." {
            idtoArray.removeFirst()
        }
        
        if idtoArray.isEmpty {
            idtoArray.append("a")
        }
        
        if idtoArray.count > 15 {
            idtoArray = Array(idtoArray[0...14])
        }
        if idtoArray.last! == "." {
            idtoArray.removeLast()
        }
        
        if idtoArray.count < 3 {
            let lastCharacter = idtoArray.last!
            while idtoArray.count < 3 {
                idtoArray.append(lastCharacter)
            }
        }
        
        return idtoArray.joined()
    }
}
