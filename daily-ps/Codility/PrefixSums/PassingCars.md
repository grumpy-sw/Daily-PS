### Codility Lesson 5(Prefix Sums) - PassingCars
👉 [문제 링크](https://app.codility.com/programmers/lessons/5-prefix_sums/passing_cars/)

### 나의 접근 방법
배열 A를 차례로 순회한다. 동쪽으로 가는 차량인 경우 동쪽으로 향하는 차량의 수를 증가시키고, 서쪽으로 가는 차량인 경우 현재 동쪽으로 향하는 차량의 수만큼 쌍을 증가시킨다.

예시) A = [0, 1, 0, 1, 1]인 경우
- A[0] = 0 이므로 동쪽으로 향하는 차량이므로 eastCars += 1
- A[1] = 1 이므로 서쪽으로 향하는 차량이 A[0]을 마주칠 수 있으므로 count += 1
- A[2] = 0 이므로 동쪽으로 향하는 차량이므로 eastCars += 1
- A[3] = 1 이므로 서쪽으로 향하는 차량이 A[0], A[2]와 마주칠 수 있다. 따라서 count += 2
- A[4] = 1 이므로 서쪽으로 향하는 차량이 A[0], A[2]와 마주칠 수 있다. 따라서 count += 2 

### 코드

```swift
public func solution(_ A : inout [Int]) -> Int {
    var eastCars = 0
    var count = 0
    for index in 0..<A.count {
        if A[index] == 0 {
            eastCars += 1
        } else {
            count += eastCars
        }
    }

    return count > 1000000000 ? -1 : count
}
```
