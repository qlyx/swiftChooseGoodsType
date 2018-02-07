
//
//  GoodsinfoView.swift
//  shoppingcart
//
//  Created by 澜海利奥 on 2018/2/5.
//  Copyright © 2018年 江萧. All rights reserved.
//

import UIKit

class GoodsinfoView: UIView {
    var promatLabel:UILabel!
    var goodsImage:UIImageView!
    var goodsTitleLabel:UILabel!
    var goodsCountLabel:UILabel!
    var goodsPriceLabel:UILabel!
    var closeButton:UIButton!
    
    var _model:GoodsModel! 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //图片
        goodsImage = UIImageView.init()
        goodsImage.image = UIImage.init(named: "1")
        goodsImage.contentMode = UIViewContentMode.scaleAspectFill
        goodsImage.clipsToBounds = true
        addSubview(goodsImage)
        goodsImage.snp.makeConstraints { (mark) in
            mark.width.equalTo(kSize(width: 80))
            mark.height.equalTo(kSize(width: 80))
            mark.left.equalTo(kSize(width: 15))
            mark.top.equalTo(kSize(width: 15))
        }
        //关闭按钮
        closeButton = UIButton.init(type: UIButtonType.custom)
        closeButton.setImage(UIImage.init(named: "guanbi"), for: UIControlState.normal)
        addSubview(closeButton)
        closeButton.snp.makeConstraints { (mark) in
            mark.width.equalTo(kSize(width: 40))
            mark.height.equalTo(kSize(width: 40))
            mark.right.equalTo(kSize(width: -10))
            mark.top.equalTo(kSize(width: 10))
        }
        //标题
        goodsTitleLabel = UILabel.init()
        goodsTitleLabel.text = ""
        goodsTitleLabel.font = UIFont.systemFont(ofSize: 15)
        addSubview(goodsTitleLabel)
        goodsTitleLabel.snp.makeConstraints { (mark) in
            mark.right.equalTo(kSize(width: -60))
            mark.height.equalTo(kSize(width: 20))
            mark.left.equalTo(goodsImage.snp.right).offset(kSize(width: 10))
            mark.top.equalTo(goodsImage.snp.top)
        }
        //价格
        goodsPriceLabel = UILabel.init()
        goodsPriceLabel.text = ""
        goodsPriceLabel.font = UIFont.systemFont(ofSize: 14)
        goodsPriceLabel.textColor = UIColor.red
        addSubview(goodsPriceLabel)
        goodsPriceLabel.snp.makeConstraints { (mark) in
            mark.right.equalTo(kSize(width: -10))
            mark.height.equalTo(kSize(width: 20))
            mark.left.equalTo(goodsImage.snp.right).offset(kSize(width: 10))
            mark.top.equalTo(goodsTitleLabel.snp.bottom)
        }
        //库存
        goodsCountLabel = UILabel.init()
        goodsCountLabel.text = "dd"
        goodsCountLabel.font = UIFont.systemFont(ofSize: 14)
        goodsCountLabel.textColor = UIColor.lightGray
        addSubview(goodsCountLabel)
        goodsCountLabel.snp.makeConstraints { (mark) in
            mark.right.equalTo(kSize(width: -10))
            mark.height.equalTo(kSize(width: 20))
            mark.left.equalTo(goodsImage.snp.right).offset(kSize(width: 10))
            mark.top.equalTo(goodsPriceLabel.snp.bottom)
        }
        //提示文字
        promatLabel = UILabel.init()
        promatLabel.text = ""
        promatLabel.font = UIFont.systemFont(ofSize: 14)
        promatLabel.textColor = UIColor.gray
        addSubview(promatLabel)
        promatLabel.snp.makeConstraints { (mark) in
            mark.right.equalTo(kSize(width: -10))
            mark.height.equalTo(kSize(width: 20))
            mark.left.equalTo(goodsImage.snp.right).offset(kSize(width: 10))
            mark.top.equalTo(goodsCountLabel.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initData(model:GoodsModel){
        _model = model
        goodsImage.image = UIImage.init(named: model.imageId)
        goodsTitleLabel.text = model.title
        goodsCountLabel.text = "库存:\(model.totalStock)"
        goodsPriceLabel.text = "¥\(model.price.minPrice) ¥\(model.price.minOriginalPrice) "
        
        //let attributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.lightText,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),NSAttributedStringKey.underlineStyle.hashValue:1] as! [NSAttributedStringKey : Any]
        let attritu = NSMutableAttributedString(string: goodsPriceLabel.text!)
        let range = (goodsPriceLabel.text! as NSString).range(of: "¥\(model.price.minOriginalPrice)")
        attritu.addAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.lightGray,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),NSAttributedStringKey(rawValue: NSAttributedStringKey.baselineOffset.rawValue):0,NSAttributedStringKey(rawValue: NSAttributedStringKey.strikethroughStyle.rawValue):1], range: range)
        goodsPriceLabel.attributedText = attritu
    }
    
    //根据选择的属性组合刷新商品信息
    func resetData(sizeModel:SizeAttributeModel) {
        //判断图片id是否为空
        if sizeModel.imageId.isEmpty
        {
            goodsImage.image = UIImage(named: sizeModel.imageId)
        }
        else {
            goodsImage.image = UIImage(named: _model.imageId)
        }
       
        goodsCountLabel.text = "库存:\(sizeModel.stock)"
        goodsPriceLabel.text = "¥\(sizeModel.price) ¥\(sizeModel.originalPrice) "
        
        let attritu = NSMutableAttributedString(string: goodsPriceLabel.text!)
        let range = (goodsPriceLabel.text! as NSString).range(of: "¥\(sizeModel.originalPrice)")
        attritu.addAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.lightGray,NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),NSAttributedStringKey(rawValue: NSAttributedStringKey.baselineOffset.rawValue):0,NSAttributedStringKey(rawValue: NSAttributedStringKey.strikethroughStyle.rawValue):1], range: range)
        goodsPriceLabel.attributedText = attritu
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
