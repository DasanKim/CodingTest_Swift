let n = Int(readLine()!)!
var numbers: [Int] = []

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

numbers.sorted().forEach { print($0) }