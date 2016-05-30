//
//  QQLrcLabel.swift
//  QQMusic
//
//  Created by xiaomage on 16/5/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class QQLrcLabel: UILabel {

    
    var progress: Double = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
  
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // 1. 设置填充色
        UIColor.greenColor().set()
        
        let progressFloat = CGFloat(progress)
        
        let fillRect = CGRectMake(rect.origin.x,  rect.origin.y, rect.size.width * progressFloat, rect.size.height)
        
        // SourceIn /* R = S*Da */
        // SourceOut /* R = S*(1 - Da) */
        UIRectFillUsingBlendMode(fillRect, .SourceIn)
        
        
    }


}
