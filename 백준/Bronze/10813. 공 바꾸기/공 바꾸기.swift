let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
var b = [Int]()

for i in 0..<inputs[0] {
    b.append(i)
}

for _ in 0..<inputs[1] {
    let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
    b.swapAt(nums[0]-1, nums[1]-1)
}

print(b.map { String($0+1) }.joined(separator: " "))