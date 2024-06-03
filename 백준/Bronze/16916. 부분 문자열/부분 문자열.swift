let s = readLine()!.map { String($0) }
let p = readLine()!.map { String($0) }

// p에 대한 실패함수 필요
let f = failure(p)
var j = 0
var result = false

for i in 0..<s.count {
    while j > 0 && s[i] != p[j] {
        j = f[j-1]
    }
    if s[i] == p[j] { j += 1 }
    if j == p.count {
        result = true
        break
    }
}

print(result ? "1" : "0")

func failure(_ strs: [String]) -> [Int] {
    var f = Array(repeating: 0, count: strs.count)
    var j = 0

    for i in 1..<strs.count {
        while j > 0 && strs[i] != strs[j] {
            j = f[j-1]
        }
        if strs[i] == strs[j] {
            j += 1
            f[i] = j
        }
    }
    return f
}