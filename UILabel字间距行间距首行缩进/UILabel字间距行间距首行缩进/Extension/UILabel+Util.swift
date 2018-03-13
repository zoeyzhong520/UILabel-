//
//  UILabel+Util.swift
//  ReadBook
//
//  Created by JOE on 2017/7/17.
//  Copyright © 2017年 Hongyear Information Technology (Shanghai) Co.,Ltd. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text:String?=nil, font:UIFont?=nil, textColor:UIColor?=nil, textAlignment:NSTextAlignment?=nil, masksToBounds:Bool?=nil, cornerRadius:CGFloat?=nil, borderColor:UIColor?=nil, borderWidth:CGFloat?=nil, adjustsFontSizeToFitWidth:Bool?=nil, numberOfLines: Int?=nil) {
        
        self.init()
        
        if let tmpText = text {
            self.text = tmpText
        }
        
        if let tmpFont = font {
            self.font = tmpFont
        }
        
        if let tmpTextColor = textColor {
            self.textColor = tmpTextColor
        }
        
        if let tmpTextAligment = textAlignment {
            self.textAlignment = tmpTextAligment
        }
        
        if let tempAdjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth {
            self.adjustsFontSizeToFitWidth = tempAdjustsFontSizeToFitWidth
        }
        
        if let tempNumberOfLines = numberOfLines {
            self.numberOfLines = tempNumberOfLines
        }
        
        
        if let tempMasksToBounds = masksToBounds {
            self.layer.masksToBounds = tempMasksToBounds
        }
        
        if let tempCornerRadius = cornerRadius {
            self.layer.cornerRadius = tempCornerRadius
        }
        
        if let tempBorderColor = borderColor {
            self.layer.borderColor = tempBorderColor.cgColor
        }
        
        if let tempBorderWidth = borderWidth {
            self.layer.borderWidth = tempBorderWidth
        }
    }
    
    //MARK: 给UILabel设置行间距和字间距
    ///给UILabel设置行间距和字间距
    /// - Parameters:
    ///   - lineSpace: 行间距
    ///   - labelText: 内容
    ///   - font: 字体
    ///   - ZSapce: 字间距
    func ZZJ_setLineSpace(withLineSpace lineSpace: CGFloat, withLabelText labelText: String, withFont font: UIFont, withZSpace ZSapce: NSNumber) {
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineBreakMode = .byCharWrapping
        paraStyle.alignment = .left
        paraStyle.lineSpacing = lineSpace //设置行间距
        paraStyle.hyphenationFactor = 1.0
        paraStyle.firstLineHeadIndent = 0.0
        paraStyle.paragraphSpacingBefore = 0.0
        paraStyle.headIndent = 0.0
        paraStyle.tailIndent = 0.0
        
        //设置字间距 NSKernAttributeName:@1.5f
        var dic = [NSAttributedStringKey:Any]()
        if ZSapce == 0 {
            dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: NSNumber.init(value: 1.5)]
        } else {
            dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: ZSapce]
        }
        
        let attributeStr = NSAttributedString(string: labelText, attributes: dic)
        self.attributedText = attributeStr
    }
    
    //MARK: 计算UILabel的高度(带有行间距的情况)
    ///计算UILabel的高度(带有行间距的情况)
    /// - Parameters:
    ///   - text: 内容
    ///   - font: 字体
    ///   - width: 宽度
    ///   - lineSpace: 行间距
    ///   - ZSapce: 字间距
    func ZZJ_getSpaceLabelHeight(withText text: String, withFont font: UIFont, withWidth width: CGFloat, withLineSpace lineSpace: CGFloat, withZSpace ZSapce: NSNumber) -> CGFloat {
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineBreakMode = .byCharWrapping
        paraStyle.alignment = .left
        paraStyle.lineSpacing = lineSpace
        paraStyle.hyphenationFactor = 1.0
        paraStyle.firstLineHeadIndent = 0.0
        paraStyle.paragraphSpacingBefore = 0.0
        paraStyle.headIndent = 0.0
        paraStyle.tailIndent = 0.0
        
        //设置字间距 NSKernAttributeName:@1.5f
        var dic = [NSAttributedStringKey:Any]()
        if ZSapce == 0 {
            dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: NSNumber.init(value: 1.5)]
        } else {
            dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: ZSapce]
        }
        
        var options = NSStringDrawingOptions()
        options = [.usesLineFragmentOrigin, .usesFontLeading]
        let size = (text as NSString).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: options, attributes: dic, context: nil).size
        return size.height
    }
    
    //MARK: 首行缩进 计算字符串高度
    ///首行缩进 计算字符串高度
    /// - Parameters:
    ///   - text: 内容
    ///   - indentationNum: 要缩进几个字符
    ///   - textAlignment: 对齐方式
    ///   - fontSize: 字体大小
    ///   - width: 宽度
    ///   - lineSpace: 行间距
    ///   - ZSapce: 字间距
    func ZZJ_getIndentationLabelHeight(withText text: String, withStrIndentationNum indentationNum: Int, withNSTextAlignment textAlignment: NSTextAlignment, withFontSize fontSize: CGFloat, withWidth width: CGFloat, withLineSpace lineSpace: CGFloat, withZSpace ZSapce: NSNumber) -> CGFloat {
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = textAlignment
        paraStyle.headIndent = 0.0 //行首缩进
        //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
        let emptylen = fontSize * CGFloat(indentationNum)
        paraStyle.firstLineHeadIndent = emptylen
        paraStyle.tailIndent = 0.0
        paraStyle.lineSpacing = lineSpace
        
        var dic = [NSAttributedStringKey: Any]()
        if ZSapce == 0 {
            dic = [NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: NSNumber.init(value: 1.5)]
        } else {
            dic = [NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: ZSapce]
        }
        
        let attrText = NSAttributedString(string: text, attributes: dic)
        self.attributedText = attrText
        
        let height = self.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT))).height
        return height
    }
    
    //MARK: UILabel文字对齐
    ///UILabel文字对齐
    func ZZJ_labelTextAlignment() {
        
        if self.text == nil {
            return
        }
        
        let attributeString = NSMutableAttributedString(string: self.text!)
        var dic = [NSAttributedStringKey: Any]()
        dic = [NSAttributedStringKey.font: self.font]
        let attributeSize = (attributeString.string as NSString).size(withAttributes: dic)
        let adjustedSize = CGSize(width: attributeSize.width, height: attributeSize.height)
        let size = self.frame.size
        let wordSpace = NSNumber(value: Int((size.width - adjustedSize.width) / CGFloat((attributeString.length - 1))))
        attributeString.addAttribute(.kern, value: wordSpace, range: NSMakeRange(0, attributeString.length - 1))
        self.attributedText = attributeString
    }
}

















