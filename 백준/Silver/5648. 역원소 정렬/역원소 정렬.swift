var firstInputs = readLine()!.split(separator: " ").map { String($0) }
let n = Int(firstInputs.removeFirst())!
var numbers: [Int] = []

for input in firstInputs {
    numbers.append(Int(String(input.reversed()))!)
}

while numbers.count < n {
    let inputs = readLine()!.split(separator: " ").map { String($0).reversed() }
    for input in inputs {
        numbers.append(Int(String(input))!)
    }
}

for number in numbers.sorted() {
    print(number)
}