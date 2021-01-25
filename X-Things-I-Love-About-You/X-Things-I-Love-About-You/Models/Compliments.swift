//
//  Compliments.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import Foundation

struct Compliment {
    let title: String
    let dialogue: String
    let image: String
}

struct AllCompliments {
    var compliments: [Compliment] {
        getCompliments()
    }
    
    func getCompliments() -> [Compliment] {
        var compliments: [Compliment] = []
        
        let complimentOne = Compliment(title: "Smile", dialogue: "I love the way you smile", image: "smile")
        let complimentTwo = Compliment(title: "Funny", dialogue: "You're the funniest person I know", image: "funny")
        let complimentThree = Compliment(title: "Confidence", dialogue: "Your confidence is alluring", image: "confidence")
        
        compliments += [complimentOne, complimentTwo, complimentThree]
        
        return compliments
    }
}
