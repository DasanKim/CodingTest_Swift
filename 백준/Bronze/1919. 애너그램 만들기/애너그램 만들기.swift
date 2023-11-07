let input1 = readLine()!
let input2 = readLine()!

var array = Array(repeating: 0, count: 26)

for c in input1 {
    array[Int(c.asciiValue!) - 97] += 1
}

for c in input2 {
    array[Int(c.asciiValue!) - 97] -= 1
}
    
print(array.reduce(0){ abs($0) + abs($1) })