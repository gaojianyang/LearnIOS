//
//  ChatViewController.swift
//  Only
//
//  Created by gaojianyang on 15/7/30.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import UIKit


class ChatViewController:UIViewController,UITableViewDelegate,UITableViewDataSource,FHInputToolbarDelegate{

    var coverView:UIView?
    var tableView:UITableView=UITableView()
    var tableSource:NSMutableArray=[]
    var inputToolbar:FHInputToolbar=FHInputToolbar(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height-44, UIScreen.mainScreen().bounds.width, 44))
    var friend:UserInfo=UserInfo(id:1,name:"lucy@fuhaodemacbook-pro.local")
    var lordUser:UserInfo=UserInfo(id:0,name:"")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backggroundImageView:UIImageView = UIImageView(image: UIImage(named: ""))
        backggroundImageView.frame=CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
       self.view.addSubview(backggroundImageView)
        
        self.tableView.dataSource=self
        self.tableView.delegate=self
    self.tableView.registerClass(MessageCell.self, forCellReuseIdentifier: MessageCell.reuseIdentifier() as String!)
        
    self.tableView.frame=CGRectMake(0, 60, self.view.frame.width, self.view.frame.height-60)
      self.tmpTableSource()
        let headerView: UIView=UIView()
        headerView.frame=CGRectMake(0, 0, self.tableView.frame.width, 10)
        headerView.backgroundColor=UIColor.clearColor()
        self.tableView.tableHeaderView=headerView
        self.tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor=UIColor.clearColor()
        self.view.addSubview(self.tableView)
        self.inputToolbar.delegate=self
        self.view.addSubview(self.inputToolbar)
        
//        self.coverView=UIView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
//        self.coverView!.backgroundColor=UIColor.blackColor()
//        self.coverView!.layer.opacity=0.2
//        self.view.addSubview(self.coverView!)
//        self.coverView?.hidden=true
//        (UIApplication.sharedApplication().delegate as! AppDelegate.)
        //ser swipe recognizer
//        var swipeRightRecognizer=UISwipeGestureRecognizer(target: self, action: "onSwiped")
//        swipeRightRecognizer.direction=UISwipeGestureRecognizerDirection.Right
//        self.view.addGestureRecognizer(swipeRightRecognizer)
        //        var swipeLeftRecognizer=UISwipeGestureRecognizer(target: self, action: "onSwiped")
        //        swipeLeftRecognizer.direction=UISwipeGestureRecognizerDirection.Left
        //        self.view.addGestureRecognizer(swipeLeftRecognizer)
      
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardFrameWillChange", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
    }
    deinit{
    
    NSNotificationCenter.defaultCenter().removeObserver(self)
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(Bool())
        if CurrentNaviGationMode == NavigationMode.tabbar{
        (UIApplication.sharedApplication().delegate as! AppDelegate).tabbarController?.tabBar.hidden=true
        
        }
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(Bool())
        if CurrentNaviGationMode == NavigationMode.tabbar{
            (UIApplication.sharedApplication().delegate as! AppDelegate).tabbarController?.tabBar.hidden=false
            
        }
    }
    
    func setupNavigationTitle(text:String){
    
    var title=(text.componentsSeparatedByString("@"))[0]
        var titleLabel:UILabel=UILabel(frame: CGRectMake(50, 0, 220, 44))
    titleLabel.text=title
        titleLabel.textColor=UIColor.blackColor()
        titleLabel.textAlignment=NSTextAlignment.Center
        titleLabel.backgroundColor=UIColor.clearColor()
        titleLabel.font=UIFont(name:"ChalkboardSE-Regular",size:18)
        self.navigationItem.title = title
        self.navigationItem.titleView = titleLabel
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{return self.tableSource.count}
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier(MessageCell.reuseIdentifier() as String) as! MessageCell
       cell.selectionStyle=UITableViewCellSelectionStyle.None
        cell.setupMessageCell(message: self.tableSource.objectAtIndex(indexPath.row) as! MessageInfo, user: self.lordUser)
    return cell
    
    
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return MessageCell.heightForCell(self.tableSource.objectAtIndex(indexPath.row) as! MessageInfo)
    }

    func tmpTableSource(){
    
        let message1:MessageInfo=MessageInfo(id: 1, body: "Hi", ImageUrl: "", time: 2.00, user: friend, target: lordUser)
        self.tableSource.addObject(message1)
    
    }
    func onInputBtnRapped(text: String) {
        if(text.isEmpty){return}
//        if(((UIApplication.sharedApplication().delegate as! AppDelegate).xmppStream?.isConnected()) != true){reutrn}
    
        let lastMessage:MessageInfo=self.tableSource.lastObject as! MessageInfo
        let lastId:Int = lastMessage.messageId!
        let message: MessageInfo=MessageInfo(id: lastId+1, body: text, ImageUrl: "", time: 2.00, user: lordUser, target: friend)
        self.tableSource.addObject(message)
        self.tableView.reloadData()
        let path:NSIndexPath=NSIndexPath(forRow: self.tableSource.count-1, inSection: 0)
        self.tableView.scrollToRowAtIndexPath( path ,atScrollPosition : UITableViewScrollPosition.Bottom, animated: true)
//        var sendMessage:DDXMElement=DDXMLElement.elementWithName("message") as!DDXMElement
//        sendMessage.addAttributeWithName("type",stringValue:"chat")
//        sendMessage.addAttributeWithName("to",stringValue:self.friend.name)
//
//        sendMessage.addAttributeWithName("from",stringValue:self.lordUser.name)

    }
    func onLeftBtnTapped(text: String) {
        return
    }
    func keyboardFrameWillChange(notify:NSNotification){
    
    let userinfo=notify.userInfo!
        let duration=userinfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        let keyboardFrame=(userinfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()

        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.tableView.frame=CGRectMake(0,60,self.view.frame.width,self.view.frame.height-60-self.inputToolbar.frame.height - keyboardFrame.height)
            self.inputToolbar.frame=CGRectMake(0, UIScreen.mainScreen().bounds.height-44-keyboardFrame.height, UIScreen.mainScreen().bounds.width, 44)
        }) { (Bool) -> Void in
            let path:NSIndexPath=NSIndexPath(forRow: self.tableSource.count-1, inSection: 0)
            self.tableView.scrollToRowAtIndexPath(path, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            
        }
    }
    func keyboardWillHide(notify:NSNotification){
    let userInfo = notify.userInfo!
        let duration=userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.tableView.frame=CGRectMake(0,60,self.view.frame.width,self.view.frame.height-60-self.inputToolbar.frame.height)
            self.inputToolbar.frame=CGRectMake(0, UIScreen.mainScreen().bounds.height-44, UIScreen.mainScreen().bounds.width, 44)

        })
    
    
    }
    //mark :appdelegate xmpp delegate
    func didReceiveMessage(messageInfo:MessageInfo){
    
        if messageInfo.user.name == self.friend.name{
            let lastMessage:MessageInfo=self.tableSource.lastObject as! MessageInfo
            let lastId:Int=lastMessage.messageId!
            let message:MessageInfo=MessageInfo(id: lastId+1, body: messageInfo.messageBody!, ImageUrl: "", time: 2.00, user: messageInfo.user, target:messageInfo.target)
            self.tableSource.addObject(messageInfo)
            self.tableView.reloadData()
            let patn:NSIndexPath=NSIndexPath(forRow: self.tableSource.count-1, inSection: 0)
            
            
        
        
        }
        
    
    }

}
