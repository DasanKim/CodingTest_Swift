func solution() {
    let n = Int(readLine()!)!
    var arr = Array(repeating: true, count: n+1)
    var prime = [Int]()
    
    if n == 1 {
        print("0")
        return
    }
    
    arr[1] = false
    
    for i in 2...n {
        if arr[i] == true {
            for j in stride(from: i*i, through: n, by: i) {
                arr[j] = false
            }
        }
    }
    
    for i in 2...n {
        if arr[i] == true {
            prime.append(i)
        }
    }
    
    let m = prime.count
    var end = 0
    var total = prime[0]
    var result = 0
    
    for start in 0..<m {
        while end < m && total <= n {
            if total == n {
                result += 1
                break
            }
            end += 1
            if end != m {
                total += prime[end]
            }
        }
        if end == m { break }
        total -= prime[start]
    }
    
    print(result)
}

solution()