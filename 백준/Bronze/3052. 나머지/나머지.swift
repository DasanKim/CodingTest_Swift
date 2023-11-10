var nums = Set<Int>()

for _ in 0..<10 {
    let num = Int(readLine()!)!
    nums.insert(num % 42)
}

print(nums.count)