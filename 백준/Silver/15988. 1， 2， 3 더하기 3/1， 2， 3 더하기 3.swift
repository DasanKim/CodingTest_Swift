let t = Int(readLine()!)!
var arr: [Int] = [0, 1, 2, 4]
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    if n > arr.count-1 {
        result += "\(process(n))\n"
    } else {
        result += "\(arr[n])\n"
    }
}

print(result)

func process(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    if 1...3 ~= n { return arr[n] }

    for i in arr.count...(n%1000000009) {
        arr.append((arr[i-1] + arr[i-2] + arr[i-3]) % 1000000009)
    }
    return arr[n]
}