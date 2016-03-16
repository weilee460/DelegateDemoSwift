//
//  ViewController.swift
//  DelegateDemoSwift
//
//  Created by ying on 16/3/16.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditGirlNameViewControllerDelegate {
    
    let cellIdentifier = "BeautifulGirlCell"
    let IMAGE_NAME = "imageName"
    let GIRL_NAME = "girlName"

    @IBOutlet weak var girlTableView: UITableView!
    
    private var dataSource:Array<Dictionary<String, String>>?
    private var selectIndexPath: NSIndexPath?
    
    func createSourceData() {
        self.dataSource = Array<Dictionary<String, String>>();
        for (var i = 0; i<10; i++) {
            let imageName:String = "00\(i).jpg"
            let girlName:String = "美女\(i + 1)"
            self.dataSource?.append([IMAGE_NAME:imageName, GIRL_NAME:girlName])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        girlTableView.dataSource = self
        girlTableView.delegate = self
        createSourceData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - Table View Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 18
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: BeautifulGirlTableViewCell = girlTableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BeautifulGirlTableViewCell
        let tempItem: Dictionary? = self.dataSource![indexPath.row]
        
        if tempItem != nil
        {
            let imageName: String = tempItem![IMAGE_NAME]!
            cell.girlImage.image = UIImage(named: imageName)
            
            let girlName: String = tempItem![GIRL_NAME]!
            cell.girlNameLabel.text = girlName
        }
        
        return cell
    }
    
    
    //MARK: - TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        selectIndexPath = indexPath
        let currentSelectCell: BeautifulGirlTableViewCell? = girlTableView.cellForRowAtIndexPath(indexPath) as? BeautifulGirlTableViewCell
        
        let editViewController: EditGirlNameViewController = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("EditGirlNameViewController") as! EditGirlNameViewController
        
        editViewController.delegate = self
        
        if currentSelectCell != nil
        {
            editViewController.girlOldName = currentSelectCell!.girlNameLabel.text
        }
        
        //push viewcontroller to navigationcontroller stack.
        //First Seen, important
        navigationController?.pushViewController(editViewController, animated: true)

    }
    
    //MARK: - EditGirlNameViewControllerDelegate
    func fetchGirlName(name: String) {
        if selectIndexPath != nil
        {
            let index = (selectIndexPath?.row)!
            dataSource![index][GIRL_NAME] = name
            girlTableView.reloadData()
        }
    }
}

