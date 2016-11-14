//
//  QSTabSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 13/11/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

//enum QSType: Int {
//    case Reserve = 0
//    case Nearby = 1
//    case Delivery = 2
//}

class QSTabSectionController: IGListSectionController, IGListSectionType {
    
    var tab: QuickSelectionTab?

    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: 160, height: height - 10)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: QuickSelectionTabCell.self, for: self, at: index) as! QuickSelectionTabCell
        cell.setCell(data: tab)
        cell.layer.cornerRadius = 3.0
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.tab = object as? QuickSelectionTab
    }
    
    func didSelectItem(at index: Int) {}

    
}
