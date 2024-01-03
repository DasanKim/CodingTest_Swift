let n = Int(readLine()!)!
var eggs: [(Int, Int)] = []
var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    eggs.append((input[0], input[1]))
}

process(0)
print(result)

func process(_ x: Int) { // x: 현재 들고 있는 계란
    if x == n {
        return
    }
    
    for i in 0..<n {
        if eggs[x].0 <= 0 { // 내 계란이 깨져있으면 x+1로 넘어가기
            process(x+1)
        } else { // 부딪히려는 계란이 깨져있으면 다음으로 넘어가기
            if x != i && eggs[i].0 > 0 {
                eggs[x].0 -= eggs[i].1
                eggs[i].0 -= eggs[x].1
                count(eggs)
                process(x+1)
                eggs[x].0 += eggs[i].1
                eggs[i].0 += eggs[x].1
            }
        }
    }
}

func count(_ eggs: [(Int, Int)]) {
    var count = 0
    for egg in eggs {
        if egg.0 <= 0 { count += 1 }
    }
    result = max(result, count)
}