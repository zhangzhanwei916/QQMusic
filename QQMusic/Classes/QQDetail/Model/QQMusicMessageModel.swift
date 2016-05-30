//
//  QQMusicMessageModel.swift
//  QQMusic
//
//  Created by 张战威 on 16/5/16.
//  Copyright © 2016年 张战威. All rights reserved.
//  提供播放详情界面展示的详细信息

import UIKit

class QQMusicMessageModel: NSObject {

    // 记录播放的数据模型
    var musicM: QQMusicModel?
    
    // 记录当前的播放时间
    var costTime: NSTimeInterval = 0
    // 记录歌曲总时长
    var totalTime: NSTimeInterval = 0
    
    
    // 计算属性, 根据已经播放的时长, 格式化一个时间字符串
    var costTimeFormat: String {
        get {
            return QQTimeTool.getFormatTime(costTime)
        }
    }
    
    // 计算属性, 根据音频总时长, 格式化一个时间字符串
    var totalTimeFormat: String {
        get {
            return QQTimeTool.getFormatTime(totalTime)
        }
    }
    
    // 记录当前的播放状态
    var isPlaying: Bool = false
    
}
