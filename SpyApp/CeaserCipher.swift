import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decode(_ plaintext: String, secret: String) -> String
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String {
        
        if isOnlyAlpha(plaintext)
        {
            var encoded = ""
            if Int32(secret) == nil
            {
                return "enter a secret key thats valid"
            }
            var shiftBy = Int32(secret)!
            
            if Int32(secret)! <= -26
            {
                shiftBy = Int32(secret)! % -26
            }
            if Int32(secret)! >= 26
            {
                shiftBy = Int32(secret)! % 26
            }
            
         let newText = plaintext.uppercased()
            for character in newText
            {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = Int32(unicode) + shiftBy
                if (shiftedUnicode < 65)
                {
                    let toActuallyShift = 64 - shiftedUnicode
                    shiftedUnicode = 90 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                
                else if (shiftedUnicode) > 90
                {
                    let toActuallyShift = shiftedUnicode - 90
                    shiftedUnicode = 64 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print("shiftedCharacter < 65: \(shiftedUnicode)")
                    continue
                }
                else
                {
                    let shiftedUnicode = Int32(unicode) + shiftBy
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            return encoded
        }
        else
        {
            return "enter words valid words with alphabets only"
        }
    }
        
    func decode(_ plaintext: String, secret: String) -> String {
        if isOnlyAlpha(plaintext)
        {
            var encoded = ""
            if Int32(secret) == nil
            {
                return "enter a vlid secret key"
            }
            
            var shiftBy = Int32(secret)!
            
            if Int32(secret)! <= -26
            {
                shiftBy = Int32(secret)! % -26
            }
            if Int32(secret)! >= 26
            {
                shiftBy = Int32(secret)! % 26
            }
            
            let newText = plaintext.uppercased()
            for character in newText
            {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = Int32(secret)! - shiftBy
                if (shiftedUnicode < 65)
                {
                    let toActuallyShift = 64 - shiftedUnicode
                    shiftedUnicode = 90 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print("shiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                    
                }
                
                else if (shiftedUnicode > 90)
                {
                    let toActuallyShift = shiftedUnicode - 90
                    shiftedUnicode = 64 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print ("shiftedUnicode > 90: \(shiftedUnicode)")
                    
                }
                
                else
                {
                    let shiftedUnicode = Int32(unicode) + shiftBy
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    print("shiftedCharacter neutral: \(shiftedUnicode)")
                }
                
            }
            return encoded
        }
        else
        {
            return "enter only alphabetical characters"
        }
}

    func isOnlyAlpha(_ key: String) -> Bool
    {
        var hasOnlyAlpha = true
        let newKey = key.uppercased()
        for character in newKey
        {
            if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90)
            {
                hasOnlyAlpha = false
            }
        }
        return hasOnlyAlpha
    
    }
}
