let input = readLine()!.split(separator: "-")
let first = input[0].split(separator: "+").compactMap({ Int($0) }).reduce(0, +)
var second = 0

for i in 1..<input.count {
    second += input[i].split(separator: "+").compactMap({ Int($0) }).reduce(0, -)
}

print(first+second)