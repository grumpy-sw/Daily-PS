### Codility Lession 17(Dynamic Programming) - NumberSolitaire
👉 [문제 링크](https://app.codility.com/programmers/lessons/17-dynamic_programming/number_solitaire/)

### 나의 접근 방법
- 문제의 핵심은 A[0]을 무조건 밟고 시작한다는 것
- 그리고 A[i]가 음수일 수도 있다는 것(0으로 초기화하면 안됨)
- 따라서 이중 for문을 사용할 때 첫 번째 for문 진입할 때 `dp[j] = dp[j-1] + A[j]`을 해주고 내부에서 2에서 6까지 빼고 계산하였다.(`dp[j-i] + A[j]`)

### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> Int {
    let N = A.count
    var dp = [A[0]] + Array(repeating: 0, count: N)

    for j in 1..<N {
        dp[j] = dp[j-1] + A[j]
        for i in 2...6 {
            if j >= i {
                dp[j] = max(dp[j], dp[j - i] + A[j])
            }
        }
    } 
    return dp[N-1]
}
```

