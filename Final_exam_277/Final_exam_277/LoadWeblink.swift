//
//  LoadWeblink.swift
//  Final_exam_277
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation


class LoadWeblink {
    
    let urlString = "https://hr.nju.edu.cn"
    //let NJUurlString = "https://www.baidu.com/"
    
    func getevents(type: Int) -> [Event] {

        var result: [Event] = []

        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url, encoding: String.Encoding.utf8)
                //print("Link https://hr.nju.edu.cn/")

                let news = contents.slices(from: "news_title\"><a ", to: "</span></li>")
                var current = 0
                
                for item in news {
                    let href = item.slices(from: "href='", to: "'")
                    let title = item.slices(from: "title='", to: "'")
                    let countStr = item.slices(from: "\\(", to: "\\)")
                    let count = Int(countStr[countStr.count-1])
                    var isHot = false
                    if count! >= 1000{
                        isHot = true
                    }
                    let toAdd = Event(title[0], href[0], isHot)
                    
                    if (type == 0) && (current < 8) {
                        result.append(toAdd)
                    }
                    if (type == 1) && (current >= 8) && (current < 16) {
                        result.append(toAdd)
                    }
                    if (type == 2) && (current >= 16) && (current < 23) {
                        result.append(toAdd)
                    }
                    if (type == 3) && (current >= 23) && (current < 29) {
                        result.append(toAdd)
                    }
                    current += 1
                }
            } catch {
                print("contents could not be loaded")
            }
        } else {
            print("Error. ")
        }
        
        return result
    }
}

extension String {
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func slices(from: String, to: String) -> [String] {
        let pattern = "(?<=" + from + ").*?(?=" + to + ")"
        return ranges(of: pattern, options: .regularExpression).map{
            String(self[$0]) }
    }
}
