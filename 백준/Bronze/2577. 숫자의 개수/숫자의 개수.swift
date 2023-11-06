var array = Array(repeating: 0, count: 10)
var num = 1

for _ in 0..<3 {
    num *= Int(readLine()!)!
}

for c in String(num) {
    let index = Int(String(c))!
    array[index] += 1
}

print(array.map{ String($0) }.joined(separator: "\n"))