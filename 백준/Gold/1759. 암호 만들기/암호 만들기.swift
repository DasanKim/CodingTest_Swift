let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let str = readLine()!.split(separator: " ").map({ String($0) }).sorted()

let l = inputs[0]
let c = inputs[1]

var result = ""

process(0, index: 0, pw: "")
print(result)

func process(_ x: Int, index: Int, pw: String) {
    if x == l, check(pw: pw) {
        result += "\(pw)\n"
        return
    }

    for i in index..<c {
        process(x+1, index: i+1, pw: pw + str[i])
    }
}

func check(pw: String) -> Bool {
    var vowelCnt = 0
    var consonantCnt = 0

    for i in pw {
        if i == "a" || i == "e" || i == "i" || i == "o" || i == "u" {
            vowelCnt += 1
        } else {
            consonantCnt += 1
        }
    }

    if vowelCnt >= 1 && consonantCnt >= 2 { return true }
    return false
}