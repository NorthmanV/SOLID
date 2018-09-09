//: Open/closed principle

import UIKit

protocol CanWriteCode {
    func programming() -> String
}

class ObjCDeveloper: CanWriteCode {
    func programming() -> String {
        return "Objective-C"
    }
}

class SwiftDeveloper: CanWriteCode {
    func programming() -> String {
        return "Swift"
    }
}

class WebDeveloper: CanWriteCode {
    func programming() -> String {
        return "Ruby"
    }
}

class Team {
    let team: [CanWriteCode]
    
    init(team: [CanWriteCode]) {
        self.team = team
    }
    
    func programming() -> [String] {
        return team.map { $0.programming() }
    }
}

let ios1 = ObjCDeveloper()
let ios2 = ObjCDeveloper()
let ios3 = SwiftDeveloper()
let web1 = WebDeveloper()

let team = Team(team: [ios1, ios2, ios3, web1])
team.programming()  // "Objective-C", "Objective-C", "Swift", "Ruby"














