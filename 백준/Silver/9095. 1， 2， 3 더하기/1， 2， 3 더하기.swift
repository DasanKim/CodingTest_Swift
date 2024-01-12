let t = Int(readLine()!)!
var arr: [Int] = []
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    arr = Array(repeating: 0, count: 11)
    setup()
    result += "\(process(n))\n"
}

print(result)

func process(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    if 1...3 ~= n { return arr[n] }

    for i in 4...n {
        arr[i] = arr[i-1] + arr[i-2] + arr[i-3]
    }
    return arr[n]
}

func setup() {
    arr[1] = 1
    arr[2] = 2
    arr[3] = 4
}