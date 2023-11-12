let count = Double(readLine()!)!
let inputs = readLine()!.split(separator: " ").compactMap { Double($0) }
let m = inputs.max()!

print(inputs.reduce(0.0) { $0 + ($1 / Double(m) * 100) } / count)