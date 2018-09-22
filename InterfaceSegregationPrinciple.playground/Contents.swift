//: Interface segregation principle

import UIKit

// Bad approach

protocol Skills {
    var swift: Bool {get set}
    var objC: Bool {get set}
    var html: Bool {get set}
    var css: Bool {get set}
    var php: Bool {get set}
    var ruby: Bool {get set}
}


// Good approach

protocol IosSkills {
    var swift: Bool {get set}
    var objC: Bool {get set}
}

protocol FrontSkills {
    var html: Bool {get set}
    var css: Bool {get set}
}

protocol BackSkills {
    var php: Bool {get set}
    var ruby: Bool {get set}
}

class IosVacancy: IosSkills {
    var swift: Bool
    var objC: Bool
    
    init(swift: Bool, objC: Bool) {
        self.swift = swift
        self.objC = objC
    }
}

class FrontVacancy: FrontSkills {
    var html: Bool
    var css: Bool
    
    init(html: Bool, css: Bool) {
        self.html = html
        self.css = css
    }
}

class BackVacancy: BackSkills {
    var php: Bool
    var ruby: Bool
    
    init(php: Bool, ruby: Bool) {
        self.php = php
        self.ruby = ruby
    }
}
