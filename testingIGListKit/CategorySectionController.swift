//
//  CategorySectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 14/11/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class CategorySectionController: IGListSectionController, IGListSectionType, IGListAdapterDataSource {

    var object: DemoItem?
    
    var items: [IGListDiffable] = [
        CategoryModel(pk: 0, title: "Halal", imageName: "image"),
        CategoryModel(pk: 0, title: "Japanese", imageName: "image"),
        CategoryModel(pk: 0, title: "Fine Dining", imageName: "image"),
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
    
    //MARK: IGListWorkingRangeDelegate
    
//    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
//        guard downloadImage == nil,
//            task == nil,
//            let urlString = urlString,
//            let url = URL(string: urlString)
//            else { return }
//        
//        let section = collectionContext?.section(for: self) ?? 0
//        print("Downloading image \(urlString) for section \(section)")
//        
//        task = URLSession.shared.dataTask(with: url) { data, response, err in
//            guard let data = data, let image = UIImage(data: data) else {
//                return print("Error downloading \(urlString): \(err)")
//            }
//            DispatchQueue.main.async {
//                self.downloadImage = image
//                if let cell = self.collectionContext?.cellForItem(at: 0, sectionController: self) as? ImageCell {
//                    cell.setImage(image: image)
//                }
//            }
//        }
//        task?.resume()
//    }
    
//    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerDidExitWorkingRange sectionController: IGListSectionController) {}
    
}
