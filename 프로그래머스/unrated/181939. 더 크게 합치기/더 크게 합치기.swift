import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    let stringA = String(a)
    let stringB = String(b)
    
    guard let result1 = Int(stringA + stringB), 
          let result2 = Int(stringB + stringA)
    else { return 0 }
    
    return result1 < result2 ? result2 : result1
}