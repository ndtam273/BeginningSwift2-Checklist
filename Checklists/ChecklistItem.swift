//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Nguyen Duc Tam on 2017/03/04.
//  Copyright © 2017年 Nguyen Duc Tam. All rights reserved.
//

import Foundation
class ChecklistItem : NSObject, NSCoding {
    var name = ""
    var checked = false
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey: "Name")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    func toogleChecked() {
        checked = !checked
    }
}
