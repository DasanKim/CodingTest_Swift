let n = Int(readLine()!)!
var weight: [Int] = []
var ph: [Int] = []

var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    ph.append(input[0])
    weight.append(input[1])
}

process2(0)
print(result)

func process2(_ x: Int) { // x: 현재 들고 있는 계란
    if x == n {
        return
    }

    for i in 0..<n {
        if ph[x] <= 0 { // 내 계란이 깨져있으면 x+1로 넘어가기
            process2(x+1)
        } else { // 부딪히려는 계란이 깨져있으면 다음으로 넘어가기
            if x != i && ph[i] > 0 {
                ph[x] -= weight[i]
                ph[i] -= weight[x]
                count2(ph)
                process2(x+1)
                ph[x] += weight[i]
                ph[i] += weight[x]
            }
        }
    }
}

func count2(_ ph: [Int]) {
    var count = 0
    for egg in ph {
        if  egg <= 0 { count += 1 }
    }
    result = max(result, count)
}