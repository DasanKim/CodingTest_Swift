let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
var frequency: [Int: Int] = [:]
let sequence = readLine()!.split(separator: " ").compactMap { (Int($0)) }
var firstIndex: [Int: Int] = [:]
var result: [String] = []

for i in 0..<n {
    frequency[sequence[i], default: 0] += 1
    if firstIndex[sequence[i]] == nil {
        firstIndex[sequence[i]] = i
    }
}

var sorted = Set(sequence).sorted { firstIndex[$0]! < firstIndex[$1]! }
sorted.sort { frequency[$0]! > frequency[$1]! }

for i in sorted {
    result += Array(repeating: String(i), count: frequency[i]!)
}

print(result.joined(separator: " "))