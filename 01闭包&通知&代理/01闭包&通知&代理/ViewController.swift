//
//  ViewController.swift
//  01闭包&通知&代理
//
//  Created by 蒋进 on 16/1/25.
//  Copyright © 2016年 蒋进. All rights reserved.
//

import UIKit
        /*
        💗闭包案例
        A 1.定义闭包 2.初始化闭包
        A 2.判断闭包并赋值
        B .在控制器中调用闭包

        A1.声明闭包
        A2.加入Func
        B1.在控制器中调用Func

        💗代理案例
        A .定义代理 保存代理对象的方法
        B .继承代理,调用方法.

        💗通知案例
        A 1.定义常量 保存通知名称
        A 2.发出通知postNotificationName
        B 1.增加监听通知实现方法调用-移除通知
        */

class ViewController: UIViewController ,VisitorViewDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //B 1.增加监听通知实现方法调用
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "cityDidChange:", name: tongzhi, object: nil)

        
        bibao1()
    }


    
    // MARK: - 增加监听通知
    func cityDidChange(notification: NSNotification) {
        
//        // 1.更换顶部区域item的文字
//        self.selectedCityName = notification.userInfo?[MTSelectCityName] as! String
//        let topItem = regionItem.customView as? MTHomeTopItem
//        topItem!.title = "\(selectedCityName) - 全部"
//        topItem!.subtitle = ""
//        
//        // 2.刷新表格数据
//        self.collectionView?.mj_header.beginRefreshing()
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: - 闭包案例
    // Swift中定义属性, 必须在构造方法中初始化, 否则就必须加上?
    // 注意: 以下写法代表闭包的返回值可以为nil
    // var finished: ()->()?
    var finished: (()->())?
    
    func bibao1(){
        
        /*
        let sc = UIScrollView(frame: CGRect(x: 0, y: 100, width: 375, height: 44))
        sc.backgroundColor = UIColor.redColor()
        let count = 15
        let width = 50
        for i in 0..<count{
        let label = UILabel()
        label.backgroundColor = UIColor.greenColor()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(17)
        label.text = "text\(i)"
        label.frame = CGRect(x: i * width, y: 0, width: width, height: 44)
        sc.addSubview(label)
        }
        
        sc.contentSize = CGSize(width: count * width, height: 44)
        view.addSubview(sc)
        */
        let sc = createScrollView({ () -> Int in
            return 15
            }) { (index) -> UILabel in
                let width = 50
                let label = UILabel()
                label.backgroundColor = UIColor.greenColor()
                label.textColor = UIColor.darkGrayColor()
                label.font = UIFont.systemFontOfSize(17)
                label.text = "text\(index)"
                label.frame = CGRect(x: index * width, y: 0, width: width, height: 44)
                return label
        }
        view.addSubview(sc)
        
        // OC中 __weak typeof(self) weakSelf = self
        weak var weakSelf = self
        loadData { () -> () in
            
            print("更新UI")
            // 闭包和block很像, 都是提前准备好代码, 在需要时执行
            // block会对外部变量进行copy, 保证执行代码时变量还在
            // block中用到self一定要非常小心
            // 闭包也一样, 为了能够准确定位到view, 所以需要写self
            // 提示: Swift开发中能不写self就不写self, 一看到self就想到闭包
            //            self.view.backgroundColor = UIColor.redColor()
            weakSelf!.view.backgroundColor = UIColor.redColor()
        }
    }
    
    
    
    
    func createScrollView(labelCount: ()->Int, labelWithIndex: (index:Int)->UILabel) -> UIScrollView{
        // 1.创建UIScrollView
        let sc = UIScrollView(frame: CGRect(x: 0, y: 100, width: 375, height: 44))
        
        let count = labelCount()
        //        let width = 50
        
        // 2.遍历创建UILabel
        for i in 0..<count{
            /*
            let label = UILabel()
            label.backgroundColor = UIColor.greenColor()
            label.textColor = UIColor.darkGrayColor()
            label.font = UIFont.systemFontOfSize(17)
            label.text = "text\(i)"
            label.frame = CGRect(x: i * width, y: 0, width: width, height: 44)
            sc.addSubview(label)
            */
            let label = labelWithIndex(index: i)
            sc.addSubview(label)
            sc.contentSize = CGSize(width: CGFloat(count) * label.bounds.width, height: 44)
        }
        
        // 返回UIScrollView
        return sc
    }
    
    
    func loadData(finished: ()->()){
        print("耗时操作")
        // 保存闭包
        self.finished = finished
        finished()
    }
    
    // 类似于dealloc方法
    deinit{
        
        // 移除通知
        NSNotificationCenter.defaultCenter().removeObserver(self)
        print("我滚了")
    }

    //MARK: - 代理方法案例
    
    func loginBtnWillClick() {
        
    }
    func registerBtnWillClick() {
        
    }
}
