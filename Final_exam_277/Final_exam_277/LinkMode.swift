//
//  LinkMode.swift
//  Final_exam_277
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

class Event {
    
    let title: String
    let url: String
    let isHot: Bool
    
    init(_ title: String, _ url: String, _ isHot: Bool) {
        self.title = title
        self.url = url
        self.isHot = isHot
    }
}
