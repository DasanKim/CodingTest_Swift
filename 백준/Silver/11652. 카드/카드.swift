let n = Int(readLine()!)!
var numbers: [Int: Int] = [:]

for _ in 0..<n {
    let input = Int(readLine()!)!
    numbers[input, default: 0] += 1
}

print(numbers
      .max {
          $0.value != $1.value ? $0.value < $1.value : $0.key > $1.key
      }!.key
     )