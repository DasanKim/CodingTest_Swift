let n = Int(readLine()!)!
var inputs: [(Int, String)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    inputs.append((Int(input[0])!, String(input[1])))
}

for a in inputs.sorted(by: { $0.0 < $1.0 }) {
    print("\(a.0) \(a.1)")
}