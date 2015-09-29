//
//  UserInfo.swift
//  Only
//
//  Created by gaojianyang on 15/7/30.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import Foundation
import UIKit
class UserInfo:NSObject{

    var id:Int?
    var name:String?
    var nickName:String = ""
    var gender:Int = 2
    var avatar:String = ""
//    var status:IsOnline=IsOnline.off
    var discription = ""
    var signature = ""
    
    
    init(id:Int,name:String){
    
    self.id=id
    self.name=name
    
    }





}