//
//  FHInputToolbar.swift
//  Only
//
//  Created by gaojianyang on 15/7/31.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import UIKit

protocol FHInputToolbarDelegate{

    func onInputBtnRapped(text: String)
    func onLeftBtnTapped(text:String)


}
class FHInputToolbar :UIView,UITextFieldDelegate{

    var backgroundImageView:UIImageView
    var textFieldBackground:UIImageView
    var textField:UITextField
    var leftBtn:UIButton
    var rightBtn:UIButton
    var delegate:FHInputToolbarDelegate?
  
    override init(frame: CGRect) {
        self.backgroundImageView = UIImageView()
        self.textFieldBackground=UIImageView()
        self.textField=UITextField()
        self.leftBtn=UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
         self.rightBtn=UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        super.init(frame: CGRect())
        self.frame=CGRectMake(frame.origin.x, frame.origin.y, UIScreen.mainScreen().bounds.width, 44)
        self.backgroundImageView.frame=CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.backgroundImageView.image=UIImage.resizableImage(name: "")
        self.addSubview(self.backgroundImageView)
        self.leftBtn.frame=CGRectMake(5, 5, 34, 34)
        self.leftBtn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Normal )
        self.leftBtn.addTarget(self, action: "onLeftBtnTapped", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(self.leftBtn)
        self.textFieldBackground.frame=CGRectMake(34+10, 5,  UIScreen.mainScreen().bounds.width-34-10-34-10, 34)
        self.textFieldBackground.image=UIImage(named: "")
        addSubview(self.backgroundImageView)
        self.textField.frame=CGRectMake(self.textFieldBackground.frame.origin.x+5, 5, self.textFieldBackground.frame.width-10, 34)
        self.textField.borderStyle=UITextBorderStyle.None
        self.textField.backgroundColor=UIColor.clearColor()
        self.textField.placeholder="please write something"
        self.rightBtn.frame=CGRectMake(UIScreen.mainScreen().bounds.width-34-5, 5, 34, 34)
        self.rightBtn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Normal )
        self.rightBtn.addTarget(self, action: "onRightBtnTapped", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(self.rightBtn)
addSubview(self.textField)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onRightBtnTapped(sender:AnyObject){
    self.delegate?.onInputBtnRapped(self.textField.text)
        self.textField.text=""
    
    }
    func onLeftBtnTapped(sender:AnyObject){
    
        self.delegate?.onInputBtnRapped(self.textField.text)
        self.textField.text=""

    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.onRightBtnTapped(self.rightBtn)
        return false
    }


}