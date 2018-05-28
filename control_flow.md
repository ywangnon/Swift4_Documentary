# 흐름 제어

- 반복: `while`, `for-in`
- 분기: `if`, `guard`, `switch`
- 이동: `break`, `continue`

## For-In Loops

- array, dictionary, range, strings 와 다른 sequences를 반복
- 대체로 폐쇄 영역(제한된 범위)을 가질 경우 사용

**[array]**

```
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
```

**[dictionary]**

```
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// spiders have 8 legs
// cats have 4 legs
```
- (key, value) 의 튜플 형태로 반환

**[Sequences]**

```
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

**[Sequences 값이 필요 없을 경우]**

```
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// Prints "3 to the power of 10 is 59049
```

- _(밑줄)로 무시

**[마지막을 반복하지 않을 경우]**

```
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}
```
**[간격이 있게 반복]**

```
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {

    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
```
- from: 시작점
- to: 끝점(반복하지 않고 끝냄)
- by: 간격

**[마지막까지 간격 있게 반복]**

```
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {

    // render the tick mark every 3 hours (3, 6, 9, 12)
}
```

- from: 시작점
- to: 끝점(반복하고 끝냄)
- by: 간격

## While Loops

- 조건이 `true`가 될 때까지 반복
- 반복횟수를 알 수 없을 때 사용

### while

- 조건을 검사하고 시작

### Repeat-While

## Conditional Statements

### If

## Switch

- case에서 일치된 값을 임시 상수나 변수에 binding 가능
- 조건이 까다로울 경우 case에 where절 사용 가능
