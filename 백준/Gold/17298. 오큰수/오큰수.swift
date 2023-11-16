let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap{ Int($0) }
var result = Array(repeating: -1, count: n)
var stack = [Int]()

for i in 0..<n {
    while !stack.isEmpty && arr[i] > arr[stack.last!] {
        let index = stack.popLast()!
        result[index] = arr[i]
    }
    stack.append(i)
}

print(result.map({ String($0) }).joined(separator: " "))