let n = Int(readLine()!)!
var numbers: [Int] = []
var result = ""

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

for number in numbers.sorted() {
    result.write("\(number)\n")
}
print(result)