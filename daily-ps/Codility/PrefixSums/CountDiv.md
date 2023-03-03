### Codility Lession 5(Prefix Sums) - CountDiv
👉 [문제 링크](https://app.codility.com/programmers/lessons/5-prefix_sums/count_div/)

### 나의 접근 방법
- B까지의 K의 배수의 수 - A까지의 K의 배수의 수
- 만약 A가 K의 배수이면 1을 더한다.
- 예외처리: A와 B가 동일한 수일 때 A % K = 0인지 확인한다.
  
### 코드(Swift)
```swift
public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    if A == B {
        return A % K == 0 ? 1 : 0
    }
        
    return A % K == 0 ? (B/K - A/K + 1) : (B/K - A/K)
}
```
