var result = ""
var caseCount = 1

while true {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }

    if input[0] == 0, input[1] == 0, input[2] == 0 {
        break
    }

    let l = input[0] // L일동안만 사용 가능
    let p = input[1] // 연속하는 P일중
    let v = input[2] // V일짜리 휴가

    var a = v / p
    var b = v % p < l ? v % p : l

    result += "Case \(caseCount): \(a * l + b)\n"

    caseCount += 1
}

print(result)