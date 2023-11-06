let input = readLine()!
var array = Array(repeating: 0, count: 26)

for c in input {
    array[Int(c.asciiValue!) - 97] += 1
}

print(array.map{ String($0) }.joined(separator: " "))