### Codility Lesson 6(Sorting) - Triangle
👉 [문제 링크](https://app.codility.com/programmers/lessons/6-sorting/triangle/)

### 나의 접근 방법
- early exit: 배열의 원소의 수가 3보다 작으면 0을 반환한다.

삼각형을 구성해야 하므로 우선 0보다 작은 값들을 모두 걸러낸다.
배열 A를 오름차순으로 정렬한 후 연속된 3개의 수로 삼각형이 되는지 확인한다.
- 삼각형이 이루어질 조건
    - P + Q > R
- 정렬을 하는 이유
    - 연속된 수로 삼각형의 조건을 확인하는 것이 삼각형이 될 확률이 높기 때문이다.

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    let A = A.filter{ $0 > 0 }.sorted()
    if A.count < 3 {
        return 0
    }
        
    for index in 0..<A.count - 2 {
        if A[index] + A[index + 1] - A[index+2] > 0 {
            return 1
        }
    }
        
    return 0
}
```
