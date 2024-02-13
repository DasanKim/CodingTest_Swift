let n = Int(readLine()!)!
var arr: [(Int, Int)] = []

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
    arr.append((inputs[0], inputs[1]))
}

arr = arr.sorted { $0.0 < $1.0 }.sorted { $0.1 < $1.1 }

var count = 0
var time = 0

for i in 0..<n {
    if time <= arr[i].0 {
        count += 1
        time = arr[i].1
    }
}

print(count)