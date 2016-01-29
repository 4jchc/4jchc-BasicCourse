//
//  ceshi.swift
//  01闭包&通知&代理
//
//  Created by 蒋进 on 16/1/27.
//  Copyright © 2016年 蒋进. All rights reserved.
//

import UIKit
//MARK: - 代理案例
// Swift中如何定义协议: 必须遵守NSObjectProtocol
protocol VisitorViewDelegate: NSObjectProtocol{
    // 登录回调
    func loginBtnWillClick()
    // 注册回调
    func registerBtnWillClick()
}
//A 1.定义常量保存通知名称
let tongzhi = "tongzhi"

class ceshi: UIView {

    
    // 定义一个属性保存代理对象
    // 一定要加上weak, 避免循环引用
    weak var delegate: VisitorViewDelegate?
    

    
    func loginBtnClick(){
        
        //A 2.发出通知postNotificationName
        NSNotificationCenter.defaultCenter().postNotificationName(tongzhi, object: nil,userInfo: nil)
        delegate?.loginBtnWillClick()
    }
    func registerBtnClick(){
        
        delegate?.registerBtnWillClick()
    }

    
    


}

//A定义代理.保存代理对象的方法
//B继承代理,调用方法,传值

//A.1定义代理协议
//protocol <#代理名字#>Delegate:NSObjectProtocol{
//    
//    func <#代理名字#>(<#参数#>:<#类型#>, <#参数#> <#参数#>:<#类型#>)
//    
//}
////A.2初始化代理协议一定要加上weak, 避免循环引用
//weak var delegate:<#代理名字#>Delegate?
//
////A.3保存代理对象的方法
//    delegate?.<#方法#>
//
////B.1通知代理
//<#代理名字#>.delegate = self
//
////B.2继承协议实现方法
//func <#代理名字#> {
//    <#实现方法#>
//}

//MARK: - 通知案例

// 定义常量保存通知的名称
let XMGPopoverAnimatorWillShow = "XMGPopoverAnimatorWillShow"
let XMGPopoverAnimatorWilldismiss = "XMGPopoverAnimatorWilldismiss"






