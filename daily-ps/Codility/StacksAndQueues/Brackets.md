### Codility Lesson 7(Stacks and Queues) - Brackets
👉 [문제 링크](https://app.codility.com/programmers/lessons/7-stacks_and_queues/brackets/)

### 나의 접근 방법
스택을 이용하여 괄호의 짝을 맞춘다.
1. 문자열을 배열로 변환한다.
2. 반복문을 통해 각 배열의 원소에 접근한다.
    2-1. 여는 괄호인 경우, 스택에 넣는다.
    2-2. 닫는 괄호인 경우, 스택의 마지막 값이 짝이 맞는 괄호인지 확인하고 제거한다.
3. 짝이 모두 맞아 스택이 비어있는지 확인한다.

### 코드

```swift
public func solution(_ S : inout String) -> Int {
    let bracketsPool = [("(", ")"), ("{", "}"), ("[", "]")]
    let arr = Array(S).map{ String($0) }
    var stack = [String]()
        
    for character in arr {
        if character == "(" || character == "{" || character == "[" {
            stack.append(character)
        } else {
            guard let last = stack.last else {
                return 0
            }
            let bracket = (last, character)
                
            if bracketsPool.contains(where: {
                return $0.0 == bracket.0 && $0.1 == bracket.1
            }) {
                stack.removeLast()
            } else {
                return 0
            }
        }
    }
        
    if stack.isEmpty {
        return 1
    }
        
    return 0
}
```
