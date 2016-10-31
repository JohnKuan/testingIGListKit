//
//  TextViewSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class TextViewSectionController: IGListSectionController, IGListSectionType {
    
    var object: TextViewModel?
    
    override init() {
        super.init()
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: TextViewCell.self, for: self, at: index) as! TextViewCell
        cell.textView.text = object?.text
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? TextViewModel
    }
    
    func didSelectItem(at index: Int) {}
}
