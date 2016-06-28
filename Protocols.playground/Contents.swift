//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"






let name = "JIM IS OK"

print(name.utf16)

let jim = String(name.characters.dropFirst(3))

//name.characters.index(name.st, offsetBy: Int)


let thirdLetterIndex = name.index(name.startIndex, offsetBy: 2)
let blah = name.characters[thirdLetterIndex]

let mister = name.substring(to: thirdLetterIndex)


//let index = name.index(name.startIndex, offsetBy: )



extension String {
    
    func truncate(from initialSpot: Int, withLengthOf endSpot: Int) -> String? {
    
        guard endSpot > initialSpot else { return nil }
        guard endSpot + initialSpot <= self.characters.count else { return nil }
        
        
        let truncated = String(self.characters.dropFirst(initialSpot))
        let lastIndex = truncated.index(truncated.startIndex, offsetBy: endSpot)
        
        return truncated.substring(to: lastIndex)
    }
    
}

let favGameOfThronesSong = "Light of the Seven"

let word = favGameOfThronesSong.truncate(from: 1, withLengthOf: 4)
// "ight"



let poop = "Jim Campagno"
poop.truncate(from: 2, withLengthOf: 11)

func getRepos(withDictionary: [String: String], withCompletion: () -> ()) {
    
    
}

// getReposWithCompletion(_:withCompletion:)


