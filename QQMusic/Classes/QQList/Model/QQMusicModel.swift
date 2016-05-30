//
//  QQMusicModel.swift
//  QQMusic
//
//  Created by xiaomage on 16/5/16.
//  Copyright © 2016年 小码哥. All rights reserved.
//  音乐数据模型, 对应的是music.plist里面的字典

import UIKit

class QQMusicModel: NSObject {

    
    /** 歌曲名称 */
    var name: String?
    
    /** 歌曲文件名称 */
    var filename: String?
    
    /** 歌词文件名称  */
    var lrcname: String?
    
    /** 演唱者 */
    var singer: String?
    
    /** 歌手头像 */
    var singerIcon: String?
    
    /** 专辑图片 */
    var icon: String?
    
    override init() {
        super.init()
    }
    
    // 提供快速的构造方法, (通过KVC进行赋值)
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dic)
    }
    
    // 为了防止外界传递一个未定义的key, 造成崩溃, 我们需要空实现这个方法
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
    
    
    
}
