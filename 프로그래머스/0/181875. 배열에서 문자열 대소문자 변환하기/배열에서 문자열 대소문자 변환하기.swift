import Foundation

func solution(_ strArr:[String]) -> [String] {
    let result = strArr.enumerated().map { 
        $0.offset % 2 != 0 ? $0.element.uppercased() : $0.element.lowercased()
    }
    return result
}