let n = Int(readLine()!)!
var str = Set<String>()
var result = ""

for _ in 0..<n { str.insert(readLine()!) }

let storedWords = str.sorted { a, b in
    (a.count != b.count) ? a.count < b.count : a < b
    }

for word in storedWords {
    result += "\(word)\n"
}
print(result)