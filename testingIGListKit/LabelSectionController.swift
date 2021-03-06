//
//  LabelSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 23/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class LabelSectionController: IGListSectionController, IGListSectionType {
    
    var object: LabelViewModel?
    
    override init() {
        super.init()
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 25)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.text = object?.text
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? LabelViewModel
    }
    
    func didSelectItem(at index: Int) {}
}
