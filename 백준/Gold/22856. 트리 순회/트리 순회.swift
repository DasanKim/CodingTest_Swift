let n = Int(readLine()!)!
var lc = Array(repeating: -1, count: n+1)
var rc = Array(repeating: -1, count: n+1)
var parent = Array(repeating: -1, count: n+1)
var visit = Array(repeating: false, count: n+1)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    lc[input[0]] = input[1]
    rc[input[0]] = input[2]
    if input[1] != -1 { parent[input[1]] = input[0] }
    if input[2] != -1 { parent[input[2]] = input[0] }
}

var endPoint = 1
var cur = 1
var move = 0

// 주의! 중위 순회의 끝 점은 가장 오른쪽에 있는 노드
while rc[endPoint] != -1 {
    endPoint = rc[endPoint]
}

while true {
    visit[cur] = true
    move += 1

    if lc[cur] != -1 && !visit[lc[cur]] {
        cur = lc[cur]
    } else if rc[cur] != -1 && !visit[rc[cur]] {
        cur = rc[cur]
    } else {
        if cur == endPoint {
            move -= 1
            break
        }
        cur = parent[cur]
    }
}

print(move)