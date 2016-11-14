//
//  QuickSelectionTab.swift
//  testingIGListKit
//
//  Created by John Kuan on 13/11/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class QuickSelectionTab: IGListDiffable {

    let pk: Int
    let title: String
    let iconName: String
    let imageName: String
    
    init(pk: Int, title: String, iconName: String, imageName: String) {
        self.pk = pk
        self.title = title
        self.iconName = iconName
        self.imageName = imageName
    }
    
    //MARK: IGListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return pk as NSObjectProtocol
    }
    
    func isEqual(_ object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        if let object = object as? QuickSelectionTab {
            return self.pk == object.pk && title == object.title
        }
        return false
    }
}
