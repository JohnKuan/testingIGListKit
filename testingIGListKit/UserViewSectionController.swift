//
//  UserViewSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class UserViewSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {

    var height: Int?
    var downloadImage: UIImage?
    var task: URLSessionDataTask?
    
    var urlString: String? {
        guard let _ = height, let _ = collectionContext?.containerSize.width else {
            return nil
        }
        return "https://s3.burpple.com/foods/28311768151bc0ed1d81459700_original.?1477472931"
    }
    
    deinit {
        task?.cancel()
    }
    
    override init() {
        super.init()
        workingRangeDelegate = self
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        //        guard let containerSize = collectionContext?.containerSize else {
        return CGSize(width: 414, height: 414)
        //        }
        //        return containerSize
        //        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        //        let height: CGFloat = CGFloat(index == 0 ? 55 : (self.height ?? 0))
        //        return CGSize(width: width, height: height)
        
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: UserCell.self, for: self, at: index)
        if let cell = cell as? UserCell {
            cell.setImage(image: downloadImage)
        }
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.height = object as? Int
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    //MARK: IGListWorkingRangeDelegate
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
        guard downloadImage == nil,
            task == nil,
            let urlString = urlString,
            let url = URL(string: urlString)
            else { return }
        
        let section = collectionContext?.section(for: self) ?? 0
        print("Downloading image \(urlString) for section \(section)")
        
        task = URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data, let image = UIImage(data: data) else {
                return print("Error downloading \(urlString): \(err)")
            }
            DispatchQueue.main.async {
                self.downloadImage = image
                if let cell = self.collectionContext?.cellForItem(at: 0, sectionController: self) as? ImageCell {
                    cell.setImage(image: image)
                }
            }
        }
        task?.resume()
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerDidExitWorkingRange sectionController: IGListSectionController) {}
    
    
}
