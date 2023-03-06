### Codility Lession 11(Sieve of Eratosthenes) - CountNonDivisible
👉 [문제 링크](https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_non_divisible/)

### 나의 접근 방법
- A의 원소에 대한 딕셔너리(`frequencyDictionary`)와 결과값을 저장해놓고 사용할 딕셔너리(`resultDictionary`)를 사용한다.
- 배열 A의 원소들을 한 바퀴 돌면서 몇 번 등장하는지 `frequencyDictionary`에 카운팅한다. 
- 약수의 개수를 구하는 방법을 응용하여 약수의 개수 대신 딕셔너리의 값을 더한다.
    - ex) `count += (frequencyDictionary[num])`
- 최종적으로 A의 길이 N에서 count를 뺀 값을 리턴한다.
- 미묘한 차이로 timeout이 발생하였는데, `resultDictionary`를 통해 이미 결과값을 구한 결과의 경우 바로 값을 사용할 수 있도록 했더니 해결되었다.
  
### 코드(Swift)
```swift
public func solution(_ A : inout [Int]) -> [Int] {
    var result = [Int]()
    let N = A.count
    var frequencyDictionary = [Int: Int]()
    var resultDictionary = [Int: Int]()
    for number in A {
        frequencyDictionary[number] = (frequencyDictionary[number] ?? 0) + 1
    }
        
    func nonFactorCounts(of num: Int) -> Int {
        if num == 1 {
            return N - (frequencyDictionary[1] ?? 0)
        }
            
        if num == 2 {
            return N - (frequencyDictionary[1] ?? 0) - (frequencyDictionary[2] ?? 0)
        }
            
        if num == 3 {
            return N - (frequencyDictionary[1] ?? 0) - (frequencyDictionary[3] ?? 0)
        }
            
        if num == 4 {
            return N - (frequencyDictionary[1] ?? 0) - (frequencyDictionary[2] ?? 0) - (frequencyDictionary[4] ?? 0)
        }
            
        if resultDictionary[num] != nil {
            return resultDictionary[num]!
        }
            
        let d = sqrt(Double(num))
        var count = (frequencyDictionary[1] ?? 0) + (frequencyDictionary[num] ?? 0)   // 1, num
        for index in 2...Int(d) {
            if index * index == num {
                count += (frequencyDictionary[index] ?? 0)
            } else if num % index == 0 {
                count += ((frequencyDictionary[index] ?? 0) + (frequencyDictionary[num/index] ?? 0))
            }
        }
        resultDictionary[num] = N - count
        return N - count
    }
        
    for number in A {
        result.append(nonFactorCounts(of: number))
    }
        
    return result
}
```
