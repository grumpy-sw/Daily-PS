### Codility Lession 12(Euclidean algorithm) - CommonPrimeDivisors
👉 [문제 링크](https://app.codility.com/programmers/lessons/12-euclidean_algorithm/common_prime_divisors/)

### 나의 접근 방법
- 처음에는 에라스토테네스의 체를 사용한 인수분해를 거친 뒤 Set으로 중복을 제거하여 둘을 비교했으나 런타임 에러가 발생하여 다른 방법을 고민했다.
    - 아마 정수 범위가 Int 범위로 주어졌는데 인수분해를 위한 배열을 만들 때 Array(repeating: 0, count: n+1)로 범위를 초과했기 때문인 것 같다.
- 문제 해결의 핵심 개념은 최대공약수이다. 두 수 A와 B의 최대공약수를 G라고 하면, A와 B를 각각 G로 나눈 몫 또한 G의 약수라면 둘은 동일한 소인수로 이루어진 수이다.
- 반대로 A와 B를 G로 나눈 몫이 G의 약수가 아니라면 그 수를 구성함에 있어 다른 소인수가 껴있다는 뜻이므로 둘은 공통의 소인수로 이루어진 수가 아니다.
- 먼저 A와 B로 G를 구한 뒤, A와 B를 G와의 최대공약수를 구한다. 두 수를 1이 될 때까지 둘의 최대공배수로 나눠주는데, 그 전에 G가 1이 된다면 A나 B에는 G에 속하지 않은 다른 소인수가 있다는 뜻이므로 false를 반환한다.
- A와 B가 모두 1까지 줄어들었다면 둘은 같은 소인수로 이루어진 수이므로 true를 반환하고 result를 1 증가시킨다.
- 이 알고리즘의 시간복잡도는 O(Z * log(max(A) + max(B))**2)이다.

### 코드(Swift)
```swift
public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    var result = 0
    let N = A.count
        
    for index in 0..<N {
        let a = A[index]
        let b = B[index]
            
        if samePrimeDiv(a, b) {
            result += 1
        }   
    }
        
    return result
}
    
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    return (a % b == 0) ? b : gcd(b, a % b)
}
    
func samePrimeDiv(_ a: Int, _ b: Int) -> Bool {
    var a = a
    var b = b
    let g = gcd(a, b)
        
    var c = g
    while a > 1 {
        c = gcd(a, c)
            
        if c == 1 {
            return false
        }
        a /= c
    }
        
    c = g
        
    while b > 1 {
        c = gcd(b, c)
            
        if c == 1 {
            return false
        }
        b /= c
    }
        
    return true
}
```
