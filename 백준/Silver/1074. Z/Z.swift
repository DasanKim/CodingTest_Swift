let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = inputs[0]
let r = inputs[1]
let c = inputs[2]

print(z(n: N, r: r, c: c))

func z(n: Int, r: Int, c: Int) -> Int {
    if n == 1 {
        if r == 0 && c == 0 { return 0 }
        if r == 0 && c == 1 { return 1 }
        if r == 1 && c == 0 { return 2 }
        //if r == 1 && c == 1 { return 3 }
        return 3
    }

    let pre = 1<<(n-1)

    if r < pre && c < pre { return 0 * pre * pre + z(n: n-1, r: r, c: c) } //0
    if r < pre && c >= pre { return 1 * pre * pre + z(n: n-1, r: r, c: c-pre)} //1
    if r >= pre && c < pre { return 2 * pre * pre + z(n: n-1, r: r-pre, c: c) } //2
    //        if r >= pre && c >= pre { return 3 * pre * pre + z(n: n-1, r: r-pre, c: c-pre) } //3

    return 3 * pre * pre + z(n: n-1, r: r-pre, c: c-pre)
}