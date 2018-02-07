
//
//  GoodsModel.swift
//  shoppingcart
//
//  Created by 澜海利奥 on 2018/2/5.
//  Copyright © 2018年 江萧. All rights reserved.
//

import UIKit

class GoodsModel: NSObject {
    var goodsNo = "" //编号
    var title = ""   //商品标题
    var imageId = ""  //缩略图id
    var totalStock = "" //总库存
    
    var itemsList = NSArray() //属性列表
    var banners = NSArray() //商品轮播图
    var sizeAttribute : NSMutableArray! //属性组合列表
    var price : GoodsPriceModel!  //价格信息-一般商品不同属性组合价格不同，会有个价格范围
}
