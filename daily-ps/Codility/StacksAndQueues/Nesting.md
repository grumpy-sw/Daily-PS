### Codility Lesson 7(Stacks and Queues) - Nesting
👉 [문제 링크](https://app.codility.com/programmers/lessons/7-stacks_and_queues/nesting/)

### 나의 접근 방법
스택을 이용하여 괄호의 짝을 맞춘다.
1. 문자열을 배열로 변환한다.
2. 반복문을 통해 각 배열의 원소에 접근한다.
    2-1. 여는 괄호인 경우, 스택에 넣는다.
    2-2. 닫는 괄호인 경우, 스택의 마지막을 제거한다.
3. 짝이 모두 맞아 스택이 비어있는지 확인한다.



### 코드

```swift
public func solution(_ S : inout String) -> Int {
    let brackets = Array(S).map{ String($0) }
    var stack = [String]()
        
    for bracket in brackets {
        if bracket == "(" {
            stack.append(bracket)
        } else {
            guard stack.last != nil else {
                return 0
            }
            stack.removeLast()
        }
    }
        
    guard stack.isEmpty else {
        return 0
    }
        
    return 1
}
```
