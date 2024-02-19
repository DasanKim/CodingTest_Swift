let n = Int(readLine()!)!
var pNum: [Int] = [] // 양수
var nNum: [Int] = [] // 음수
var hasZero: Bool = false

for _ in 0..<n {
    let input = Int(readLine()!)!
    if input > 0 {
        pNum.append(input)
    } else if input == 0 {
        hasZero = true
    } else {
        nNum.append(input)
    }
}

pNum.sort(by: >) // 양수는 내림차순으로
nNum.sort(by: <) // 음수는 오름차순으로 정렬

var result = 0

if pNum.count % 2 == 0 {
    for i in stride(from: 0, to: pNum.count, by: 2) {
        result += max(pNum[i] * pNum[i+1], pNum[i] + pNum[i+1])
    }
} else {
    for i in stride(from: 0, to: pNum.count-1, by: 2) {
        result += max(pNum[i] * pNum[i+1], pNum[i] + pNum[i+1])
    }
    result += pNum[pNum.count-1]
}

if nNum.count % 2 == 0 {
    for i in stride(from: 0, to: nNum.count, by: 2) {
        result += max(nNum[i] * nNum[i+1], nNum[i] + nNum[i+1])
    }
} else if nNum.count % 2 == 1 && hasZero {
    for i in stride(from: 0, to: nNum.count-1, by: 2) {
        result += max(nNum[i] * nNum[i+1], nNum[i] + nNum[i+1])
    }
} else {
    for i in stride(from: 0, to: nNum.count-1, by: 2) {
        result += max(nNum[i] * nNum[i+1], nNum[i] + nNum[i+1])
    }
    result += nNum[nNum.count-1]
}

print(result)