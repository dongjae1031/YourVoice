//
//  Model.swift
//  YourVoice
//
//  Created by 이동재 on 25/05/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import Foundation

class Voice{
    var content: String
    init(content: String){
        self.content=content
    }
    static var VoiceList = [
        Voice(content: "이동재"),
        Voice(content: "이동재"),
        Voice(content: "이동재"),
        Voice(content: "이동재"),
        Voice(content: "이동재")
    ]
}


//class Memo{
//    var content: String
//    var insertDate: Date
//    init(content: String){
//        self.content=content
//        insertDate=Date()
//    }
//    static var dummyMemoList = [
//        Memo(content: "dongjae"),
//        Memo(content: "1031")
//    ]
//}
