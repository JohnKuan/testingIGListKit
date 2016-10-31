//
//  TextViewCell.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit

class TextViewCell: UICollectionViewCell {
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir-Book", size: 14.0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textView)
        return textView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var viewDic = Dictionary<String, UITextView>()
        viewDic["textView"] = textView
        
        let metric = [
            "padding":10,
            "paddingsmall":5
        ]
        
        let labelHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-paddingsmall-[textView]-paddingsmall-|", options: [], metrics: metric, views: viewDic)
        let labelVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-paddingsmall-[textView]|", options: [], metrics: metric, views: viewDic)
//        let heightConstraint = NSLayoutConstraint(item: textView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 55)
//        self.contentView.addConstraint(heightConstraint)
        self.contentView.addConstraints(labelVerticalConstraint)
        self.contentView.addConstraints(labelHorizontalConstraint)
        
    }
    
}
