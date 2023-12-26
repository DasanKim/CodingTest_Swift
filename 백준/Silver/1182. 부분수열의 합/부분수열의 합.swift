let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = inputs[0]
let s = inputs[1]

let sequence = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = 0

process(0, 0)
print(s == 0 ? result-1 : result)

func process(_ x: Int, _ sum: Int) {
    if x == n {
        if sum == s { result += 1 }
        return
    }

    process(x+1, sum)
    process(x+1, sum+sequence[x])
}