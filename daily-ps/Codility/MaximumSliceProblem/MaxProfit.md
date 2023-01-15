### Codility Lesson 9(Maximum Slice Problem) - MaxProfit
👉 [문제 링크](https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_profit/)

### 나의 접근 방법

`0 ≤ P ≤ Q < N`을 만족하는 최대의 `A[Q] − A[P]`를 구해야 한다.
최소 가격인 `minValue`와 최대 이익인 `result` 변수를 사용한다.
배열을 앞에서부터 순회하며 
1) 현재 원소가 지금까지의 배열 A의 원소 중에서 최소값인지 확인한다.
2) 현재 가격에서 최소 가격을 뺀 값이 최대 이익이 되는지 확인한다.

이 두 가지를 한 번에 처리하면 배열을 한 번만 탐색하고도(`O(N)`) 발생하는 최대 이익을 구할 수 있다. 



### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    guard !A.isEmpty else {
        return 0
    }
        
    guard !(A.count == 1) else {
        return 0
    }
        
    var minValue = A[0]
    var result = 0
        
    for index in 1..<A.count {
        if A[index] < minValue {
            minValue = A[index]
        }
            
        result = max(result, A[index] - minValue)
    }
        
    return result
}
```
