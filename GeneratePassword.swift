class Solution {
    enum PasswordType: String {
        case lowercase
        case uppercase
        case number
        case special
    }
    
    func generatePassword(_ length: Int, _ types: [String]) -> String {
        guard 8 <= length && length <= 20 else {
            return "Error length"
        }
        
        guard !types.isEmpty else {
            return "Type is empty"
        }
        
        var finalPassword: [Character] = []
        var passwordTypes: [PasswordType] = []
        
        for type in types {
            guard let val = PasswordType(rawValue: type) else {
                return "Error type"
            }
            passwordTypes.append(val)
        }
        
    
        for passwordType in passwordTypes {
            let pw = getRandomCharacter(ofType: passwordType)
            finalPassword.append(pw)
        }
        
        for i in 0..<(length - passwordTypes.count) {
            let randomIndex = Int.random(in: 0..<passwordTypes.count)
            let pw = getRandomCharacter(ofType: passwordTypes[randomIndex])
            finalPassword.append(pw)
        }
        
        return String(finalPassword.shuffled())
    }
    
    func getRandomCharacter(ofType type: PasswordType) -> Character {
        var array: [Character] = []
        switch type {
        case .lowercase:
            array = Array("abcdefghijklmnopqrstuvwxyz")
        
        case .uppercase:
            array = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            
        case .number:
            array = Array("0123456789")
            
        case .special:
            array = Array("@#$%&*^")
        }
        
        let randomIndex = Int.random(in: 0..<array.count)
        return array[randomIndex]
    }
}

Solution().generatePassword(12, ["lowercase", "uppercase", "number", "special"])

