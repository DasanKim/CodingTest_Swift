let k = Int(readLine()!)!

print((1 << k) - 1)
hanoi(start: 1, dest: 3, n: k)

func hanoi(start: Int, dest: Int, n: Int) {
    if n == 1 {
        print("\(start) \(dest)")
        return
    }
    hanoi(start: start, dest: 6-start-dest, n: n-1)
    print("\(start) \(dest)")
    hanoi(start: 6-start-dest, dest: dest, n: n-1)
}