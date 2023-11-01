import Foundation

func solution(_ numLog:[Int]) -> String {
    var control = ""
    
    for i in 1..<numLog.count {
        switch numLog[i] - numLog[i-1] {
            case 1:
                control += "w"
            case -1:
                control += "s"
            case 10:
                control += "d"
            case -10:
                control += "a"
            default:
                return control
        }
    }
    
    return control
}