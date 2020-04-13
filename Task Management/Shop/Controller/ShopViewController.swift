//
//  ShopViewController.swift
//  Task Management
//
//  Created by Rahman Fadhil on 07/04/20.
//  Copyright © 2020 Bimo Sekti Wicaksono. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var clothesImage: UIImageView!
    @IBOutlet weak var hairImage: UIImageView!
    @IBOutlet weak var accessoriesImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let avatars = [UIImage(named: "body-1"), UIImage(named: "body-2"), UIImage(named: "body-3"), UIImage(named: "body-4")]
    let accessories = [UIImage(named: "accessories-1"), UIImage(named: "accessories-2"), UIImage(named: "accessories-3"), UIImage(named: "accessories-4")]
    let clothes = [UIImage(named: "clothes-1"), UIImage(named: "clothes-2"), UIImage(named: "clothes-3"), UIImage(named: "clothes-4")]
    let hairs = [UIImage(named: "hair-1"), UIImage(named: "hair-2"), UIImage(named: "hair-3"), UIImage(named: "hair-4")]
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accessories.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! CollectionViewCell
        
        cell.imageItem.image = accessories[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
