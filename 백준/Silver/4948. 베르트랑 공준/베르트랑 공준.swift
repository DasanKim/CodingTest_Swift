let MAX_N = 123456
let doubleN = 2 * MAX_N
var arr = Array(repeating: true, count: doubleN + 1)

arr[1] = false

for i in 2...doubleN {
    if arr[i] == true {
        for j in stride(from: i*i, through: doubleN, by: i) {
            arr[j] = false
        }
    }
}

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }

    var count = 0

    if n == 1 {
        print("1")
    } else {
        for i in n+1...2*n {
            if arr[i] == true {
                count += 1
            }
        }
        print(count)
    }
}