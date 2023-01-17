### Codility Lesson 10(Prime and composite numbers) - CountFactors
👉 [문제 링크](https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/count_factors/)

### 나의 접근 방법

약수의 개수를 구하는 평범한 문제.
1부터 숫자 N의 제곱근까지 반복문을 통해 number가 N의 약수이면 count를 2 증가시킨다. N이 제곱수인 경우에는 숫자를 따로 1 증가시킨다.

### 코드

```swift
public func solution(_ N : Int) -> Int {
    if N == 1 {
        return 1
    }
        
    var sqr = Int(sqrt(Double(N)))
    var count = 0
        
    if sqr * sqr == N {
        count += 1
        sqr -= 1
    }
        
    for number in 1...sqr {
        if N % number == 0 {
            count += 2
        }
    }
    return count
}
```
