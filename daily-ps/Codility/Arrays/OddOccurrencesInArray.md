### Codility Lesson 2(Arrays) - OddOccurrencesInArray
👉 [문제 링크](https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/)

### 나의 접근 방법
숫자를 오름차순으로 정렬한다. 스택을 활용하여 짝을 이루지 못한 숫자만 남기고 이를 반환한다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.count == 1 {
        return A[0]
    }
    var result = 0
    let numbers = A.sorted()
    var stack = [Int]()
    for number in numbers {
        if stack.isEmpty {
            stack.append(number)
        } else {
            let last = stack.last!
            if number == last {
                stack.removeLast()
            } else {
                break
            }
        }
    }
    result = stack.removeLast()
    return result
}
```
