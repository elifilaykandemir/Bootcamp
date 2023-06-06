import Foundation

var trimmedInput:String = ""
var isNumeric:Bool = true
var input: String = ""

extension String {
    func isFloat() -> Bool {
        return Float(self) != nil
    }
}

public func printString(_ type: String) {
    print(type)
}

public func printInteger(_ num: Int) {
    print(num)
}

public func printFloat(_ num: Float) {
    print(num)
}


public func readInteger(_ sentence: String) -> Int {
    
    var trimmedInput:String
    var isNumeric:Bool
    var input: String
    repeat{
        print(sentence,terminator: " ")
        input = readLine() ?? " "
        trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        isNumeric = trimmedInput.allSatisfy{$0.isNumber}
        if trimmedInput.isEmpty || !isNumeric {
            print("Invalid input please try again")
            
        }
    } while trimmedInput.isEmpty || !isNumeric
    
    return Int(trimmedInput) ?? 0
}


public func readFloat(_ sentence: String) -> Float {
    var trimmedInput:String
    var isFloat: Bool
    var input: String
    repeat{
        print(sentence,terminator: " ")
        input = readLine() ?? " "
        trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        isFloat = trimmedInput.isFloat()
        if trimmedInput.isEmpty || !isFloat {
            print("Invalid input please try again")
            
        }
    } while trimmedInput.isEmpty || !isFloat
    
    return Float(trimmedInput) ?? 0
}

public func readString(_ sentence: String) -> String {
    var trimmedInput:String
    var isAlpha: Bool
    var isEmpty: Bool
    var input: String
    repeat{
        print(sentence,terminator: " ")
        input = readLine() ?? " "
        trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        isAlpha = trimmedInput.allSatisfy{$0.isLetter}
        isEmpty = trimmedInput.isEmpty
        if isEmpty || !isAlpha {
            print("Invalid input please try again")
            
        }
    } while !isAlpha || isEmpty
    return trimmedInput
}

public func messageBox(_ message: String, _ messageType: String) {
    let border = String(repeating: "*", count: message.count + 4)
    print("\(border)\n* \(messageType): \(message) *\n\(border)")
}

public func greetings() {
    print("\nHoşgeldiniz...\nYatırım Ustası v1.0 by FLO Bootcamp")
}

public func byeBye() {
    print("\nİyi günler....\nYatırım Ustası v1.0 by FLO Bootcamp")
}

public func randomNumber(upto n: Int) -> Int {
    return Int(arc4random_uniform(UInt32(n))) + 1
}

public func gelirMi(_ threshold: Int) -> Bool {
    let rand = Int(arc4random_uniform(100))
    return rand < threshold
}
