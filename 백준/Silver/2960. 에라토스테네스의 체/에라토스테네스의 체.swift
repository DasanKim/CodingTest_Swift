let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let k = input[1]

var arr = Array(repeating: true, count: n+1)
var result: [Int] = []

for i in 2...n {
    if arr[i] == true {
        result.append(i)
    }

    if arr[i] == true {
        for j in stride(from: i*i, through: n, by: i) {
            if arr[j] == true {
                arr[j] = false
                result.append(j)
            }
        }
    }
}

print(result[k-1])