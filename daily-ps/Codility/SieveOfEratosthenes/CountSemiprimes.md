### Codility Lession 11(Sieve of Eratosthenes) - CountSemiprimes
👉 [문제 링크](https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_semiprimes/)

### 나의 접근 방법
- Semiprime: 두 소수끼리의 곱으로 만들어진 수(중복은 신경쓰지 않는다.)
    - 4, 6, 9, 10, 14, 15, 21, 22, 25, 26...
- '에라스토테네스의 체'를 통해 N/2까지의 모든 소수를 구한다.
- 구한 소수를 2중 for 반복문을 통해 모든 semiprime들의 개수를 구한다.
    - semiprimes: N까지의 숫자 배열로, semiprime에는 1을, 아닌 숫자 위치에는 0을 할당
- semiprimes 배열을 가지고 prefixSum을 통해 주어진 구간 내의 합(semiprime의 개수)를 구하여 리턴한다.

### 코드(Swift)
```swift
public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    if N == 1 {
        return [0]
    }
        
    let primes = sieve(N/2)
        
    var semiprimes = Array(repeating: 0, count: N+1)
    for i in 0..<primes.count {
        for j in 0..<primes.count {
            if primes[i] * primes[j] <= N {
                semiprimes[primes[i] * primes[j]] = 1
            }
        }
    }
        
    let sums = prefixSum(of: semiprimes)
    var result = [Int]()
    for index in 0..<P.count {
        let count = sums[Q[index]] - sums[P[index] - 1]
        result.append(count)
    }
            
    return result
}
    
func sieve(_ n: Int) -> [Int] {
    var primes = Array(repeating: true, count: n+1)
    var i = 2
    primes[0] = false
    primes[1] = false
    while i*i <= n {
        if primes[i] {
            var j = i * 2
            while j <= n {
                primes[j] = false
                j += i
            }
        }
        i += 1
    }
        
    var result: [Int] = []
    for index in 2..<primes.count {
        if primes[index] {
            result.append(index)
        }
    }
        
    return result
}
    
func prefixSum(of arr: [Int]) -> [Int] {
    var result = [Int]()
    result.append(arr[0])
    for index in 1..<arr.count {
        result.append(result[index-1] + arr[index])
    }
    return result
}
```

