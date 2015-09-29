//
//  FriendCell.swift
//  Only
//
//  Created by gaojianyang on 15/7/28.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import UIKit
class FriendsCell: UITableViewCell{

    var cellBackgroundView:UIView
    var avatar:UIImageView
    var nameLabel:UILabel
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.cellBackgroundView=UIView(frame: CGRectMake(0, 1, UIScreen.mainScreen().bounds.width, 55))
        self.cellBackgroundView.backgroundColor=UIColor.clearColor()
        self.avatar=UIImageView(frame: CGRectMake(5, 5, 45, 45))
        self.nameLabel=UILabel()
        self.nameLabel.frame=CGRectMake(55, 0, UIScreen.mainScreen().bounds.width-55, 55)
        self.nameLabel.text="Lucky"
        self.nameLabel.font=UIFont(name: "ChalkboardSE-regular", size: 18)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellBackgroundView.addSubview(self.avatar)
        self.cellBackgroundView.addSubview(self.nameLabel)
        self.addSubview(self.cellBackgroundView)
        self.backgroundColor=UIColor.clearColor()
        self.cellBackgroundView.layer.shadowColor=UIColor.blackColor().CGColor
        self.cellBackgroundView.layer.shadowOffset=CGSizeMake(0, 2)
        self.cellBackgroundView.layer.shadowOpacity=0.8
        self.cellBackgroundView.layer.shadowPath=CGPathCreateWithRect(self.bounds, nil)
        
        
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    class func reuseIdentifier() -> String{
    
    return "FriendsCell"
    }
    class func heightForCell() ->CGFloat {
    return 56
    }
    func setupFriendCell(#user: UserInfo){
        if user.name?.isEmpty==true{
            self.nameLabel.text="Someone"}else{
            self.nameLabel.text=(user.name!.componentsSeparatedByString("@"))[0]
        
//        self.nameLabel.text=(user.name.componentSeparatedByString("@"))[0]
        }
    
    }









}
