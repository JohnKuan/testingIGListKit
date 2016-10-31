//
//  UserCell.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class UserCell: UICollectionViewCell {

    fileprivate let nameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        name.textColor = UIColor(red: 209.0/255.0, green: 0/255.0, blue: 69.0/255.0, alpha: 1.0)
        name.baselineAdjustment = .alignBaselines
        name.lineBreakMode = .byTruncatingTail
        name.translatesAutoresizingMaskIntoConstraints = false
        name.addConstraint(NSLayoutConstraint(item: name, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 21))
        return name
    }()
    
    fileprivate let dateLabel: UILabel = {
        let date = UILabel()
        date.font = UIFont(name: "Avenir-Book", size: 12.0)
        date.textColor = UIColor.lightGray
        date.baselineAdjustment = .alignBaselines
        date.lineBreakMode = .byWordWrapping
        date.translatesAutoresizingMaskIntoConstraints = false
        date.addConstraint(NSLayoutConstraint(item: date, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 31))
        return date
    }()
    
    fileprivate let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 35.0 / 2.0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 35))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0))
        return view
    }()
    
    fileprivate let activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 35))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0))
        view.startAnimating()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(activityView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewDic = [
            "avatar": imageView,
            "name": nameLabel,
            "date": dateLabel,
            "activity": activityView
        ]
        
        let metric = [
            "padding":10,
            "paddingsmall":5
        ]
        
        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-padding-[avatar]-paddingsmall-[name]-|", options: [], metrics: metric, views: viewDic)
        
        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[name]-(-5)-[date]|", options: [], metrics: metric, views: viewDic)
        
        contentView.addConstraints(horizontalConstraint)
        contentView.addConstraints(verticalConstraint)
        
        contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0))
    
        contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: dateLabel, attribute: .leading, multiplier: 1.0, constant: 0))
        
        contentView.addConstraint(NSLayoutConstraint(item: activityView, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: activityView, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .top, multiplier: 1.0, constant: 0))
        
//        let bounds = contentView.bounds
//        activityView.center = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
//        imageView.frame = bounds
        
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
        if image != nil {
            activityView.stopAnimating()
        } else {
            activityView.startAnimating()
        }
    }
    
    func setName(name: String?) {
        nameLabel.text = name
        dateLabel.text = NSDate().description
    }

    
}
