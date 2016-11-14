//
//  QSHorizontalSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 13/11/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class QSHorizontalSectionController: IGListSectionController, IGListSectionType, IGListAdapterDataSource {
    
    var object: DemoItem?
    
    var items = [
        QuickSelectionTab(pk: 0, title: "Reservation", iconName: "reserve", imageName: "reservation_image"),
        QuickSelectionTab(pk: 1, title: "Nearby Places", iconName: "icon_inactive_pin", imageName: "nearby_image"),
        QuickSelectionTab(pk: 2, title: "Delivery", iconName: "delivery", imageName: "delivery_image")
        ]
    
    lazy var adapter: IGListAdapter = {
        let adapter = IGListAdapter(updater: IGListAdapterUpdater(),
                                    viewController: self.viewController,
                                    workingRangeSize: 0)
        adapter.dataSource = self
        return adapter
    }()
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? DemoItem
//        items.append(object as QuickSelectionTab)
    }
    
    func didSelectItem(at index: Int) {}
    
    //MARK: IGListAdapterDataSource
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return items
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return QSTabSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }

}
