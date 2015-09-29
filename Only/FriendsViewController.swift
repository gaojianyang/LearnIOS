//
//  File.swift
//  Only
//
//  Created by gaojianyang on 15/7/28.
//  Copyright (c) 2015年 gaojianyang. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var tableSource:NSMutableArray = ["Lucky","Sundy","XiRi","Polo"]
    var tableView:UITableView=UITableView()
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{return self.tableSource.count}
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    var cell=tableView.dequeueReusableCellWithIdentifier(FriendsCell.reuseIdentifier()) as! FriendsCell
cell.selectionStyle=UITableViewCellSelectionStyle.None
//        cell.setupFriendCell(user:
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return FriendsCell.heightForCell()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource=self
        self.tableView.delegate=self
        self.tableView.registerClass(FriendsCell.self, forCellReuseIdentifier: FriendsCell.reuseIdentifier())
        
    }

}