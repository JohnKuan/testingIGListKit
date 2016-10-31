//
//  ReviewSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class ReviewSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {

    var height: Int? = 410 // default
    
    func numberOfItems() -> Int {
        return 3
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        var height : CGFloat = 0
        switch index {
        case 0:
            height = width
        case 1:
            height = 71
        default:
            height = 54
        }
        return CGSize(width: width, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        switch index {
        case 0:
            let cell = collectionContext!.dequeueReusableCell(of: MainImageSectionController.self, for: self, at: index) as ImageCell
            cell.setImage(image:)
            
        case 1:
            let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as LabelCell
            cell.label.text = "Header Title"
        default:
            
        }
        
    }
    
    func didUpdate(to object: Any) {
        self.height = object as? Int
    }
    
    func didSelectItem(at index: Int) {}
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
        <#code#>
    }
    
    
}
