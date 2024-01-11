let n = Int(readLine()!)!
var words = Set<String>()
var sortedWords = [(String, Int)]()
var result = ""

for _ in 0..<n {
    let input = readLine()!
    words.insert(input)
}

for word in words {
    sortedWords.append((word, word.count))
}

let temp = sortedWords.sorted { a, b in
 (a.1 != b.1) ? a.1 < b.1 : a.0 < b.0
}

for i in temp {
    result += "\(i.0)\n"
}

print(result)