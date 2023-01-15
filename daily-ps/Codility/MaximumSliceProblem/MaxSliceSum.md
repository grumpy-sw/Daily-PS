### Codility Lesson 9(Maximum Slice Problem) - MaxSliceSum
👉 [문제 링크](https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_slice_sum/)

### 나의 접근 방법

카데인 알고리즘을 응용하여 풀 수 있는 문제인 것 같다.

Slice Sum을 포함하는 배열 `sums`를 선언한다. 배열 A를 앞에서부터 돌면서 배열 sums를 채워나간다. 배열을 채우는 방법은 다음과 같다.
- sums[index]: A[index]까지 확인했을 때 이전까지의 부분합에서 A[index]를 더한 값(sums[index-1] + A[index])과 A[index]부터 새로 시작하는 합(A[index]) 중 큰 값
- result: sums가 채워질 때마다 최대값을 저장


### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    if A.count == 1 {
        return A[0]
    }
        
    var sums = Array(repeating: A[0], count: A.count)
    var result = sums[0]
        
    for index in 1..<A.count {
        sums[index] = max(A[index], sums[index-1] + A[index])
        result = max(result, sums[index])
    }
        
    return result
}
```
