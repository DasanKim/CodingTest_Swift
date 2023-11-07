let n = Int(readLine()!)!
var result = [String]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let string1 = input[0].sorted()
    let string2 = input[1].sorted()

    result.append(string1 == string2 ? "Possible" : "Impossible")
}

result.forEach { print($0) }