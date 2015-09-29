//
//  MessageInfo.swift
//  Only
//
//  Created by gaojianyang on 15/7/30.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

enum MessageStatus:Int{

case composing = 0
    case delay = 1
    case unKnow=2


}



import Foundation
import UIKit
class MessageInfo:NSObject{

    var messageId:Int?
    var messageBody:String?
    var messageImageUrl:String?
    var messageTime:Double
    var messageStatus: MessageStatus =  MessageStatus.unKnow
    var user:UserInfo=UserInfo(id:-1,name:"someone")
    var target:UserInfo=UserInfo(id:-2,name:"host")
    
    
    
  override init(){
    self.messageTime=0
    self.messageId=0
    self.messageImageUrl=""
    self.messageBody=""
    
    
    
    
    }
    init(id:Int,body:String,ImageUrl:String,time:Double,user:UserInfo,target:UserInfo){
    
    self.messageId=id
        self.messageBody=body
        self.messageImageUrl=ImageUrl
        self.messageTime=time
        self.user=user
        self.target=target
    
    
    }
}