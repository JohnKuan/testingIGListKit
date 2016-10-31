//
//  SectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class DemoItem: NSObject {
    let name: String
    let controllerClass: UIViewController.Type
    let controllerIdentifier: String?
    
    init(name: String, controllerClass: UIViewController.Type, controllerIdentifier: String? = nil) {
        self.name = name
        self.controllerClass = controllerClass
        self.controllerIdentifier = controllerIdentifier
    }
}

class SectionController: IGListSectionController, IGListSectionType {

    var object: DemoItem?
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 55.0)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.text = object?.name
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? DemoItem
    }
    
    func didSelectItem(at index: Int) {
        if let controller = object?.controllerClass.init() {
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
