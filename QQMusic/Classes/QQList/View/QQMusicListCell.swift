//
//  QQMusicListCell.swift
//  QQMusic
//
//  Created by xiaomage on 16/5/16.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

// cell内部提供的动画类型
enum AnimationType {
    case Rotation
    case Translation
}


class QQMusicListCell: UITableViewCell {

    // 图片
    @IBOutlet weak var iconImageView: UIImageView!
    // 歌曲名称
    @IBOutlet weak var songNameLabel: UILabel!
    // 歌手名称
    @IBOutlet weak var singerNameLabel: UILabel!
    
    
    // 提供给外界赋值的数据模型, 当外界传递过来一个模型时, 在内部我们给子控件进行赋值
    var musicM: QQMusicModel? {
        didSet {
            
            // 给三个子控件进行赋值
            if musicM?.icon != nil {
                iconImageView.image = UIImage(named: (musicM?.icon)!)
            }
            songNameLabel.text = musicM?.name
            singerNameLabel.text = musicM?.singer
            
        }
    }
    
    
    // 提供快速创建cell的方法
    class func cellWithTableView(tableView: UITableView) -> QQMusicListCell {
        
        // 一定要注意, 在xib中, 设置循环利用的标识
        let cellID = "musicList"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? QQMusicListCell
        if cell == nil {
//            print("创建了cell")
            
            cell = NSBundle.mainBundle().loadNibNamed("QQMusicListCell", owner: nil , options: nil).first as? QQMusicListCell
        }
        
        
        return cell!
        
    }
    
    
    
    // 提供快速动画的方法()
    // 写到cell , 里面, 是为了重用, 维护
    func beginAnimation(type: AnimationType) -> () {
        switch type {
        case .Rotation:
            self.layer.removeAnimationForKey("rotation")
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            animation.values = [M_PI * 0.25, 0]
            animation.duration = 0.2
            self.layer.addAnimation(animation, forKey: "rotation")
            
            
        case .Translation:
            self.layer.removeAnimationForKey("translation")
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.values = [60, 0]
            animation.duration = 0.2
            self.layer.addAnimation(animation, forKey: "translation")
        
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.width * 0.5
        iconImageView.layer.masksToBounds = true
        
        
    }

    
    // 防止gao
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }
    
}
