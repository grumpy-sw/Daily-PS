### Codility Lession 15(Caterpillar method) - MinAbsSumOfTwo
👉 [문제 링크](https://app.codility.com/programmers/lessons/15-caterpillar_method/min_abs_sum_of_two/)

### 나의 접근 방법
- 합의 절대값이 최소가 되는 경우는 결과가 절대값이 비슷하고 부호가 다른 두 수의 합일 때이다.
- 따라서 배열 A를 절대값 오름차순으로 정렬한 뒤 최소값을 저장하는 변수와 자기 자신 * 2 또는 인접한 수와의 합을 비교해나갔다.
- 이 알고리즘의 시간 복잡도는 O(N * log(N))이다.

### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
    let N = A.count
    if N == 1 {
        return abs(A[0] * 2)
    }
    var M = Int.max
    let sortedA = A.sorted { num1, num2 in
        return abs(num1) < abs(num2)
    }

    for index in 0..<N {
        M = min(M, abs(sortedA[index] * 2))
        if index < N-1 {
            M = min(M, abs(sortedA[index] + sortedA[index+1]))
        }
    }
        
    return M
}
```
