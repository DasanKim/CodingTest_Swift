var n = Int(readLine()!)!
var result = ""

var i = 2
while i*i <= n {
    while n % i == 0 {
        n /= i
        result += "\(i)\n"
    }
    i += 1
}

if n != 1 { result += "\(n)"}

print(result)