let n = Int(readLine()!)!
var head = 0
var tail = 0
var isEmpty: Bool {
    head == tail
}

var arr = Array(repeating: 0, count: n)

for i in 1...n {
    push(i)
}

for _ in 0..<n {
    _ = pop()
    let num = pop()

    if isEmpty {
        print(num)
        break
    }

    push(num)
}

func push(_ num: Int) {
    arr[tail%n] = num
    tail += 1
}

func pop() -> Int {
    var num = 1

    if !isEmpty {
        num = arr[head%n]
        head += 1
    }

    return num
}