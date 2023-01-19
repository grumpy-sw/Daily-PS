### Codility Lession 12(Euclidean Algorithm) - ChocolatesByNumbers
👉 [문제 링크](https://app.codility.com/programmers/lessons/12-euclidean_algorithm/chocolates_by_numbers/)

### 나의 접근 방법
N과 M의 최소공배수를 구하고, 그 최소공배수를 M으로 나눈 몫을 구하면 된다.
최소공배수는 N * M / N과 M의 최대공약수 이므로 먼저 최대공약수를 구해야 한다.
최대공약수를 구하는 방법은 유클리드 호제법을 통해 구할 수 있다.

### 코드
```swift
public func solution(_ N : Int, _ M : Int) -> Int {
    return N / gcd(N, M)
}
    
func gcd(_ num1: Int, _ num2: Int) -> Int {
    let a = max(num1, num2)
    let b = min(num1, num2)
    if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}
```


