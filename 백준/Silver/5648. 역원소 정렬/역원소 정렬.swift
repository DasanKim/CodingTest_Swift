var firstInputs = readLine()!.split(separator: " ")
let n = Int(firstInputs.removeFirst())!
var numbers = firstInputs

while numbers.count < n {
    let inputs = readLine()!.split(separator: " ")
    numbers.append(contentsOf: inputs)
}

let arr = numbers.compactMap { Int(String($0.reversed())) }

var result = ""

for number in arr.sorted() {
    result += "\(number)\n"
}
print(result)