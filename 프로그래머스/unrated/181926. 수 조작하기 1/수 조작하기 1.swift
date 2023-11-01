import Foundation

func solution(_ n:Int, _ control:String) -> Int {
    var number = n
    
    for index in control.indices {
        switch control[index] {
            case "w":
                number += 1
            case "s":
                number -= 1
            case "d":
                number += 10
            case "a":
                number -= 10 
            default:
                return number
        }
    }
    
    return number
}