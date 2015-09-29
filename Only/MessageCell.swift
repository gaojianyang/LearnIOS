//
//  MessageCell.swift
//  Only
//
//  Created by gaojianyang on 15/7/29.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import UIKit

let avatarSize : CGSize = CGSize(width: 45, height: 45)




    class MessageCell : UITableViewCell{
    var avatar:UIImageView
    var messageLabel:UILabel
    var messageBackgroundImageview:UIImageView

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        avatar=UIImageView()
        messageBackgroundImageview=UIImageView()
    messageLabel=UILabel()
    messageLabel.font=UIFont.systemFontOfSize(16)
    messageLabel.numberOfLines=0
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.addSubview(avatar)
    self.addSubview(messageLabel)
    self.addSubview(messageBackgroundImageview)
    self.backgroundColor=UIColor.clearColor()
    
    
    
        }
        
        
        

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

        class func reuseIdentifier() -> NSString {
            
            return "MessageCell"
        }

        class func heightForCell(message:MessageInfo) ->CGFloat{
            let screenRect:CGRect=UIScreen.mainScreen().bounds
//            let str:NSString=NSString(CString: message.messagebody!., encoding: <#UInt#>))
            let labelSize:CGSize=UILabel.sizeOfString(message.messageBody!, font: UIFont.systemFontOfSize(16), maxWidth: screenRect.width-10-20-avatarSize.width*2)
            if labelSize.height < avatarSize.height+10{
            
            return avatarSize.height+10
            }else{
            
            return labelSize.height+5
            
            }
        
        
        
        
        }
        func setupMessageCell(#message:MessageInfo,user:UserInfo){
        
            let screenRect : CGRect = UIScreen.mainScreen().bounds
             let labelSize:CGSize = UILabel.sizeOfString(message.messageBody!, font: UIFont.systemFontOfSize(16), maxWidth: screenRect.width-10-20-avatarSize.width*2)
            let messageBackgroundSize:CGSize=CGSizeMake(labelSize.width+10, labelSize.height)
            if(message.user.name == user.name){
                self.avatar.frame=CGRectMake(screenRect.width - avatarSize.width-5, 5, avatarSize.width, avatarSize.height)
//            insert Avatar
//                self.avatar.image=UIImage(named:"")
               self.messageLabel.text=message.messageBody
                self.messageLabel.frame=CGRectMake(screenRect.width-5-self.avatar.frame.width-5-15-labelSize.width, 5, labelSize.width, labelSize.height)
                self.messageLabel.textAlignment=NSTextAlignment.Right
//                Insert ChatImage
//                self.messageBackgroundImageview.image=UIImage.resizableImage(name: "")
                
                self.messageBackgroundImageview.frame=CGRectMake(screenRect.width-5-self.avatar.frame.width-5-messageBackgroundSize.width, 5, messageBackgroundSize.width, messageBackgroundSize.height)
                
            
            }else{
                self.avatar.frame=CGRectMake(5, 5, avatarSize.width, avatarSize.height)
                //            insert Avatar
                //                self.avatar.image=UIImage(named:"")
                self.messageLabel.text=message.messageBody
                self.messageLabel.frame=CGRectMake(self.avatar.frame.origin.x+self.avatar.frame.width+5+15, 5, labelSize.width, labelSize.height)
                self.messageLabel.textAlignment=NSTextAlignment.Left
                //                Insert ChatImage
                //                self.messageBackgroundImageview.image=UIImage.resizableImage(name: "")
                
                self.messageBackgroundImageview.frame=CGRectMake(self.avatar.frame.origin.x+self.avatar.frame.width+5, 5, messageBackgroundSize.width, messageBackgroundSize.height)
           
            
            }
            
        
        }
        override func awakeFromNib() {
            super.awakeFromNib()
            
            
        }
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        
        
}
