let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var arr = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

for _ in 0..<input[1] {
    let sum = arr[0] + arr[1]
    arr[0] = sum
    arr[1] = sum
    arr.sort()
}

print(arr.reduce(0, +))