import Foundation

enum Mode {
    case zero
    case one
}

func solution(_ code:String) -> String {
    var mode = Mode.zero
    var ret = ""
    let codeArray = Array(code)
    
    for idx in 0 ..< codeArray.count {
        switch mode {
            case .zero:
                if codeArray[idx] == "1" { 
                    mode = Mode.one 
                } else { 
                    if idx % 2 == 0 {
                        ret += String(codeArray[idx])
                    } 
                }
            case .one:
                if codeArray[idx] == "1" {
                    mode = Mode.zero
                } else {
                    if idx % 2 == 1 {
                        ret += String(codeArray[idx])
                    }
                }
        }
    }
    
    return ret.isEmpty ? "EMPTY" : ret
}