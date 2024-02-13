let inputs = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = inputs[0]
var k = inputs[1]
var arr: [Int] = [0]

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var index = n
var coinCount = 0

while index != 0 && k != 0 {
    if arr[index] > k {
        index -= 1
        continue
    } else {
        coinCount += k / arr[index]
        k = k % arr[index]
    }
}

print(coinCount)