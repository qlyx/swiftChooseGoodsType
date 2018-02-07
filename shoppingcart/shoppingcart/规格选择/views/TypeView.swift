
//
//  TypeView.swift
//  shoppingcart
//
//  Created by 澜海利奥 on 2018/2/5.
//  Copyright © 2018年 江萧. All rights reserved.
//
import Foundation
import UIKit

class TypeView: UIView {
    var height = CGFloat(0)
    //定义block
    typealias textBlock = (_ selectIndex:Int)->()
    var selectButton:textBlock?
    
    var selectIndex = 0
    var typeArray:NSArray!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initWith(arr:NSArray,typeName:String,index:Int)
    {
        selectIndex = index
        typeArray = arr
        
        let lab = UILabel.init(frame: CGRect(x: 10, y: 10, width: 200, height: 20))
        lab.text = typeName
        lab.textColor = UIColor.black
        lab.font = UIFont.systemFont(ofSize: 14)
        addSubview(lab)
        
        var upX = 10,upY = 40
        for i:Int in 0..<arr.count
        {
            let btn = UIButton.init(type: UIButtonType.custom)
            let text:String = arr.object(at: i) as! String
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.setTitle(text, for: UIControlState.normal)
            btn.setTitle(text, for: UIControlState.selected)
            btn.setTitleColor(UIColor.black, for: UIControlState.normal)
            btn.setTitleColor(UIColor.white, for: UIControlState.selected)
            btn.backgroundColor = UIColor.lightGray
            let dic = NSDictionary(object: UIFont.systemFont(ofSize: 13), forKey: NSAttributedStringKey.font as NSCopying)
            
            let size: CGSize = text.size(withAttributes: (dic as! [NSAttributedStringKey : Any]))
            if upX > Int(self.frame.size.width-20-size.width-40){
                upX = 10
                upY += 30
            }
            btn.frame = CGRect(x: upX, y: upY, width: Int(size.width+30.0), height: Int(24))
            cutCorner(cornerRadius: 12, borderWidth: 1, borderColor: UIColor.white, view: btn)
            self.addSubview(btn)
            btn.tag = 100+i
            btn.addTarget(self, action: #selector(self.touchbtn), for: UIControlEvents.touchUpInside)
            upX += Int(size.width+40)
            if selectIndex == i
            {
                btn.isSelected = true
                btn.backgroundColor = KBtncol
            }
        }
        upY += 30
        let line = UILabel.init(frame: CGRect(x: 0, y: CGFloat(upY+10), width: self.frame.size.width, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        addSubview(line)
       height = CGFloat(upY+11)
        
    }
    
    @objc func touchbtn(button:UIButton) {
        if button.isSelected == false
        {
            selectIndex = button.tag-100
        }else
        {
            selectIndex = -1
        }
        for i:Int in 0..<typeArray.count {
            let btn :UIButton = viewWithTag(100+i) as! UIButton
            btn.isSelected = false
            btn.backgroundColor = UIColor.lightGray
            if selectIndex == i
            {
                btn.isSelected = true
                btn.backgroundColor = KBtncol
            }
        }
        //传值
        if let selectButton  =  self.selectButton {
            selectButton(selectIndex)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
