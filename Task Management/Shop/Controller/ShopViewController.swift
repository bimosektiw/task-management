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
    
    struct Item {
        var itemImage: String
        var itemButtonLabel: String
    }
    
    struct Avatar {
        var avatarImage: String
        var avatarButtonLabel: String
    }
    
    let avatars = [
        Avatar(avatarImage: "body-1", avatarButtonLabel: "$50"),
        Avatar(avatarImage: "body-2", avatarButtonLabel: "$30"),
        Avatar(avatarImage: "body-3", avatarButtonLabel: "$20"),
        Avatar(avatarImage: "body-4", avatarButtonLabel: "$10")
        ]
    let accessories = [
        Item(itemImage: "accessories-1", itemButtonLabel: "$60"),
        Item(itemImage: "accessories-2", itemButtonLabel: "$40"),
        Item(itemImage: "accessories-3", itemButtonLabel: "$70"),
        Item(itemImage: "accessories-4", itemButtonLabel: "$90")
        ]
    let clothes = [
        Item(itemImage: "clothes-1", itemButtonLabel: "$120"),
        Item(itemImage: "clothes-2", itemButtonLabel: "$110"),
        Item(itemImage: "clothes-3", itemButtonLabel: "$150"),
        Item(itemImage: "clothes-4", itemButtonLabel: "$130")
        ]
    let hairs = [
        Item(itemImage: "hairs-1", itemButtonLabel: "$170"),
        Item(itemImage: "hairs-2", itemButtonLabel: "$190"),
        Item(itemImage: "hairs-3", itemButtonLabel: "$200"),
        Item(itemImage: "hairs-4", itemButtonLabel: "$180")
        ]
    
    var items = [Item]()
    var angkaAja: Int = 1
    
    var arrCombined : NSMutableArray!
    var arrSection = ["Accessories", "Clothes", "Hair"]
    
    func getItems(forSectionItem section:Int){
        switch section {
        case 0:
            items = accessories
            //return items
            break
        case 1:
            items = clothes
            //return items
            break
        case 2:
            items = hairs
            //return items
            break
        default:
            items = accessories
            //return items
            break
        }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusable : UICollectionReusableView? = nil
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "reusableView", for: indexPath) as! CollectionReusableView
            view.titleCollection.text = arrSection[indexPath.section]
            
            reusable = view
            
            
            
        default:
            print("Nothing")
        }
        
        return reusable!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrSection.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print((arrCombined.object(at: section) as! NSArray).count)
        //print(items.count)
        //angkaAja = angkaAja + 1
        //print("section : ",angkaAja)
        //return (arrCombined.object(at: section) as! NSArray).count
        switch section {
        case 0:
            return accessories.count
        case 1:
            return clothes.count
        case 2:
            return hairs.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? CollectionViewCell{
            
            getItems(forSectionItem: indexPath.section)
//
//            print(items.count)
            
            let item = items[indexPath.row]
            print("Ini ngelet nih")
            
            switch indexPath.section {
            case 0:
                cell.imageItem.image = UIImage(named: item.itemImage)
                cell.buttonItem.titleLabel?.text = item.itemButtonLabel
                print(item.itemImage)
            case 1:
                cell.imageItem.image = UIImage(named: item.itemImage)
                cell.buttonItem.titleLabel?.text = item.itemButtonLabel
                print(item.itemImage)
            case 2:
                cell.imageItem.image = UIImage(named: item.itemImage)
                cell.buttonItem.titleLabel?.text = item.itemButtonLabel
                print(item.itemImage)
            default:
                print("Nothing")
            }
            cell.cellView.layer.cornerRadius = cell.cellView.frame.width/8
            cell.buttonItem.layer.cornerRadius = cell.cellView.frame.height/4
                   
            return cell
        }
        return CollectionViewCell()
    }
    
//    func displayItem(Section: Int) -> Int {
//        collectionView(<#T##collectionView: UICollectionView##UICollectionView#>, numberOfItemsInSection: <#T##Int#>)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.reloadData()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumInteritemSpacing = 0
        
        arrCombined = NSMutableArray(array: [accessories, clothes, hairs])
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
