import Foundation

func solution(_ numbers:[Int]) -> String {
    let result = numbers.sorted { a, b in
        let ab = String(a) + String(b)
        let ba = String(b) + String(a)
        //print(ab)
        //print(ba)

        return ab > ba
    }.map { String($0) }
    
    return result[0] == "0" ? "0" : result.joined()
}