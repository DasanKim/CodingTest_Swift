let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: 1000005)

print(process(n: n))

func process(n: Int) -> Int {
    arr[1] = 0
    if n == 1 { return arr[1] }

    for i in 2...n {
        arr[i] = arr[i-1] + 1
        if i % 3 == 0 { arr[i] = min(arr[i], arr[i/3] + 1) }
        if i % 2 == 0 { arr[i] = min(arr[i], arr[i/2] + 1) }
    }
    return arr[n]
}