let t = Int(readLine()!)!
var arr: [Int] = [0, 1, 2, 4]
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!

    if n > arr.count-1 {
        for i in arr.count...n {
            arr.append((arr[i-1] + arr[i-2] + arr[i-3]) % 1000000009)
        }
    }
    result += "\(arr[n])\n"
}

print(result)