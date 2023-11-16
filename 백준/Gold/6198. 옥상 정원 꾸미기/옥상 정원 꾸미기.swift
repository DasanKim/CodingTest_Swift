let n = Int(readLine()!)!
var arr = [Int]()
var result = Array(repeating: 0, count: n)
var stack = [Int]()

for _ in 0..<n {
    let h = Int(readLine()!)!
    arr.append(h)
}

arr.append(1000000001)

for i in 0..<n+1 {
    while !stack.isEmpty && arr[i] >= arr[stack.last!] {
        let index = stack.popLast()!
        result[index] = i - index - 1
    }
    stack.append(i)
}

print(result.reduce(0, +))