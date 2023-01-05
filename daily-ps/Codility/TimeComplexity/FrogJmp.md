### Codility Lesson 3(Time Complexity) - FrogJmp
👉 [문제 링크](https://app.codility.com/programmers/lessons/3-time_complexity/frog_jmp/)

### 나의 접근 방법
개구리가 움직여야 하는 거리: Y - X
- if (Y - X) % D == 0 : 거리를 점프길이로 나눈 몫 만큼 점프해야 한다.
- if (Y - X) % D != 0 : 남은 나머지만큼 한번 더 뛰어야 하므로 몫 + 1 만큼 점프해야 한다.

### 코드
```swift
public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    var count = 0
    count = (Y - X) % D == 0 ? (Y - X) / D : (Y - X) / D + 1

    return count
}
```
