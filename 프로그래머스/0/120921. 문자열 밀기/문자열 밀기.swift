import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var a = A.map { String($0) }
    var b = B.map { String($0) }
    var temp: [String] = a
    
    var count = 0
    
    while count < a.count {
        if temp == b { break }
        
        count += 1
        
        for i in 0..<a.count {
            let newIndex = (i+count) % a.count
            if b[newIndex] != a[i] { break }
            temp[newIndex] = a[i]
        }
    }

    return temp != b ? -1 : count
}