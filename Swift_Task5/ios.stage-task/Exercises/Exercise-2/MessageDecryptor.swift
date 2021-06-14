import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        //var firstStr = message
        var start = 0
        var finish = 0
        
        for i in message {
            if (i == "[") { start += 1 }
            if (i == "]") { finish += 1 }
        }
        if (start != finish) { return "" }
        if (message.count) > 60 { return "" }
        if (start == 0) {return message}
        
        return strToDecrypt(message)
    }
    
    
    func strToDecrypt(_ str: String) -> String {
    
    var inCases = ""
    var multiplierStr = ""
    var multiplierArr: Array<Int> = []
    var substringsArr: Array<String> = []
    //var inCasesBool = false
        
    for char in str {
        if char.isNumber {
            multiplierStr.append(char)
            
        } else {
            
            
            if (char == "[") {
                var countStr = Int(multiplierStr)
                if (multiplierStr == "") {countStr = 1}
                if (countStr! > 300) {return ""}
                multiplierArr.append(countStr!)
                multiplierStr = ""
                
                //inCasesBool = true
                substringsArr.append(inCases)
                inCases = ""
            }
                
            if ((char != "[") && (char != "]")) {
                inCases.append(char)
            }
            
            if (char == "]") {
                
                var insideString = ""
                                
                let multiplier = multiplierArr.popLast()
                                    
                for _ in 0..<multiplier! {
                     insideString += inCases
                }
                                
                let strInArray = substringsArr.popLast()
                inCases = strInArray! + insideString
                
                //inCasesBool = false
            }
        }
    }
    return inCases
    }
}
