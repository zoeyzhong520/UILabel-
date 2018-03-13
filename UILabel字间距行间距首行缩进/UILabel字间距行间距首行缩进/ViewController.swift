//
//  ViewController.swift
//  UILabel字间距行间距首行缩进
//
//  Created by JOE on 2018/3/13.
//  Copyright © 2018年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "UILabel字间距行间距首行缩进"
        self.setPage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    
    fileprivate func setPage() {
        
        let labelText = "字间距行间距首行缩进字间距行间距   首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进 \n 字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进字间距行间距首行缩进"
        let labelText1 = "字间距行间距首行缩进字间距行间距"
        
        let label = UILabel(text: labelText, font: UIFont.systemFont(ofSize: 17), textColor: UIColor.white, textAlignment: .left, numberOfLines: 0)
        label.backgroundColor = UIColor.orange
        label.ZZJ_setLineSpace(withLineSpace: 5, withLabelText: labelText, withFont: UIFont.systemFont(ofSize: 17), withZSpace: 5)
        
//        let labelH = label.ZZJ_getSpaceLabelHeight(withText: labelText, withFont: UIFont.systemFont(ofSize: 17), withWidth: view.bounds.size.width, withLineSpace: 5, withZSpace: 5)
        let labelH = label.ZZJ_getIndentationLabelHeight(withText: labelText, withStrIndentationNum: 5, withNSTextAlignment: .left, withFontSize: 17, withWidth: view.bounds.size.width, withLineSpace: 5, withZSpace: 5)
        label.frame = CGRect(x: 0, y: 100, width: view.bounds.size.width, height: labelH)
        
        view.addSubview(label)
    }
}



















