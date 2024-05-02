let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let r = input[1]
let q = input[2]

var arr = Array(repeating: [Int](), count: n+1)
var size = Array(repeating: 0, count: n+1)

for _ in 0..<n-1 {
    let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
    arr[uv[0]].append(uv[1])
    arr[uv[1]].append(uv[0])
}

_ = dfs(cur: r)

var result = ""

for _ in 0..<q {
    let query = Int(readLine()!)!
    result += "\(size[query])\n"
}

print(result)

func dfs(cur: Int) -> Int {
    size[cur] = 1

    for next in arr[cur] where size[next] == 0 {
        size[cur] += dfs(cur: next)
    }
    return size[cur]
}