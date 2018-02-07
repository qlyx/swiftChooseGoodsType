//
//  ChoosTypeTableViewCell.swift
//  shoppingcart
//
//  Created by 澜海利奥 on 2018/2/6.
//  Copyright © 2018年 江萧. All rights reserved.
//

import UIKit

class ChoosTypeTableViewCell: UITableViewCell {
    var typeView :TypeView!
    var _model : GoodsTypeModel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        typeView = TypeView(frame: CGRect(x:0,y:100,width:kWidth,height:10))
        addSubview(typeView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(model:GoodsTypeModel) -> CGFloat {
        _model = model
        typeView.initWith(arr: model.typeArray, typeName: model.typeName, index: model.selectIndex)
        return (typeView?.height)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
