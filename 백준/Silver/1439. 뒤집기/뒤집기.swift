let s = readLine()!
let zero = s.split(separator: "1")
let one = s.split(separator: "0")

print(min(zero.count, one.count))