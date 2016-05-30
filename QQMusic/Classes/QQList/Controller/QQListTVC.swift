//
//  QQListTVC.swift
//  QQMusic
//
//  Created by 张战威 on 16/5/16.
//  Copyright © 2016年 张战威. All rights reserved.
//

import UIKit

class QQListTVC: UITableViewController {

    // 数据模型, 用来显示音乐信息
    // 在didSet, 方法中, 刷新表格, 代表更新了数据源, 就应该刷新表格, 显示最新的数据
    var musicMs: [QQMusicModel] = [QQMusicModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 界面操作
        setUpInit()
        
        // 需要数据 -> 展示
        
        // 数据怎么获取, 抽成一个工具类
        // 好处: 重用性高,
        QQMusicDataTool.getMusicList { (musicMs) in
            
            // 展示数据
            self.musicMs = musicMs
            
            // 2. 给播放器工具类, 进行复制播放列表
            QQMusicOperationTool.shareInstance.musicMList = musicMs
            
        }
    }

   
    

    
}


// 数据展示
extension QQListTVC {
    
    // 获取多少行
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicMs.count
    }
    
    
    // 返回什么样的cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 快速创建cell的方法
        let cell = QQMusicListCell.cellWithTableView(tableView)
        
        // 取出模型
        let musicM = musicMs[indexPath.row]
        cell.musicM = musicM
        
        return cell
        
        
    }
    
    // 在获取cell的地方
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 做动画
        let musicCell = cell as! QQMusicListCell
        musicCell.beginAnimation(AnimationType.Rotation)
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 1. 拿到数据模型
        let musicM = musicMs[indexPath.row]
        
        // 2. 根据数据模型, 播放音乐
        QQMusicOperationTool.shareInstance.playMusic(musicM)
        
        
        
        // 跳转到详情界面
        // 业务逻辑
        performSegueWithIdentifier("listToDetail", sender: nil)
    }
    
    
    // 可以在滚动的时候, 做一些动画实现
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // 改哪些cell 的frame
        guard let indexPaths = tableView.indexPathsForVisibleRows else {
            return
        }
        
        
        // 计算中间一行对应的索引
        let first = indexPaths.first?.row ?? 0
        let last = indexPaths.last?.row ?? 0
        let middle = Int(Float(first + last) * 0.5)
        
        // 根据距离中间的偏移量, 来设置对应的移动偏移量
        for indexPath in indexPaths {
            
            // 1. 取出cell 
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.x = CGFloat(abs(indexPath.row - middle) * 20)
            
        }
        
        
        
        
    }
    
    
}

// 界面搭建
extension QQListTVC {
    
    
    // 提供一个统一界面设置的方法, 供外界调用
    private func setUpInit() {
        
        setUpTableView()
        setUpNavigationBar()
        
    }
    
    // 设置表格
    private func setUpTableView() -> () {
        let backView = UIImageView(image: UIImage(named: "QQListBack.jpg"))
        tableView.backgroundView = backView
        tableView.rowHeight = 60
        tableView.separatorStyle = .None
    }
    
    // 设置导航栏隐藏
    private func setUpNavigationBar() -> () {
        navigationController?.navigationBarHidden = true
    }
    
    // 设置状态栏为白色
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}




