let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0], k = nk[1]
var arr = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr.append(input)
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] > arr[i][k] + arr[k][j] {
                arr[i][j] = arr[i][k] + arr[k][j]
            }
        }
    }
}

var result = Set<Int>()
var visited = Set<Int>()

visited.insert(k) // 위치 주의!
process(start: k, cost: 0, count: 1)

print(result.min()!)

func process(start: Int, cost: Int, count: Int) {
    if count == n {
        result.insert(cost)
        return
    }

    for (dest, n) in arr[start].enumerated() where start != dest {
        if !visited.contains(dest) {
            visited.insert(dest)
            process(start: dest, cost: cost + n, count: count + 1)
            visited.remove(dest)
        }
    }
}