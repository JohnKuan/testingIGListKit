//
//  QuickSelectionTabCell.swift
//  testingIGListKit
//
//  Created by John Kuan on 13/11/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class QuickSelectionTabCell: UICollectionViewCell {

    fileprivate let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        title.textColor = UIColor(red: 209.0/255.0, green: 0/255.0, blue: 69.0/255.0, alpha: 1.0)
        title.baselineAdjustment = .alignBaselines
        title.textAlignment = .right
        title.translatesAutoresizingMaskIntoConstraints = false
        title.sizeToFit()
        title.addConstraint(NSLayoutConstraint(item: title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 21))
        return title
    }()
    
    fileprivate let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0))
        return view
    }()
    
    fileprivate let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0))
//        view.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0))
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
//        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewDic = [
            "background": imageView,
            "titleLabel": titleLabel,
            "iconView": iconView
        ]
        
        let metric = [
            "padding":10,
            "paddingsmall":5
        ]
        
        
        
        self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .trailingMargin, relatedBy: .equal, toItem: titleLabel, attribute: .trailingMargin, multiplier: 1.0, constant: 10))
        self.addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1.0, constant: 0))
        
        self.addConstraint(NSLayoutConstraint.init(item: iconView, attribute: .topMargin, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: 5))
        self.addConstraint(NSLayoutConstraint.init(item: iconView, attribute: .leadingMargin, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: 10))
        
        
        //        let horizontalIconViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-paddingsmall-[iconView]", options: [], metrics: metric, views: viewDic)
//        let horizontalTitleLabelConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-padding-[titleLabel]-|", options: [], metrics: metric, views: viewDic)
//        let verticalconViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-paddingsmall-[iconView]|", options: [], metrics: metric, views: viewDic)
//        let verticaTitleLabelConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-padding-[titleLabel]-|", options: [], metrics: metric, views: viewDic)
        
//        contentView.addConstraints(horizontalIconViewConstraint)
//        contentView.addConstraints(horizontalTitleLabelConstraint)
//        contentView.addConstraints(verticalconViewConstraint)
//        contentView.addConstraints(verticaTitleLabelConstraint)
        
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[background]|", options: [], metrics: metric, views: viewDic))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[background]|", options: [], metrics: metric, views: viewDic))
    }
    
    func setImage(image: UIImage?) {
        imageView.image = nil
    }
    
    func setTitle(title: String?) {
        titleLabel.text = title
    }
    
    func setIcon(icon: UIImage?) {
        iconView.image = icon
    }
    
    func setCell(data: QuickSelectionTab?) {
        setTitle(title: data?.title)
        setIcon(icon: UIImage(named: (data?.iconName)!))
        setImage(image: UIImage())
    }
    

}
