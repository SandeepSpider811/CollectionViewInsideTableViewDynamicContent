

import UIKit
import Kingfisher

let cellID = "ExpandedCell"

class ViewController: UITableViewController {
    
    var selectedIndexPath: IndexPath?
    var indexPaths : Array<IndexPath> = []
    
    var objOfDataClass = [
        DataClass(contentHead : "Fruits & Vegetables" , contentDesc : "Fruits & vegetable Baskets. Vegetables, Fruits, Cut Fresh, Sprouts & Herbs", contentURL : URL(string : "http://www.pngall.com/wp-content/uploads/2016/03/Vegetable-Free-PNG-Image.png"), subContURL : [URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!], subContName : ["1","34","3"] ),
        DataClass(contentHead : "Grocery & Staples" , contentDesc : "Pulses, Rice & Flour, Dry fruits & nuts, Edible Oils & ghee, Spices, Salt & Sugar, Organic Staples", contentURL : URL(string : "http://ancebazaar.com/image//grocery-and-staples-1000x500.png"), subContURL : [URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!], subContName : ["1","2","3"] ),
        DataClass(contentHead : "Household Needs" , contentDesc : "Laundary Detergents, DishWashers, & Cleaners, Repellants & Freshners, Kitchen & Dining", contentURL : URL(string : "http://way2door.com/images/icons/Household_Needs.jpg"), subContURL : [URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!], subContName : ["23454","2","3","567"] ),
        DataClass(contentHead : "Personal Care" , contentDesc : "Soaps, Face & Hand Wash, Hair Care, Oral Care, Skin Care, Shaving & Hair Removal creams.", contentURL : URL(string : "http://www.austinwelcomecenter.org/images/pcs3.png"), subContURL : [URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!], subContName : ["23454","2","3","567"] ),
        DataClass(contentHead : "Breakfast & Dairy" , contentDesc : "Milk & Milk Products, Paneer & Curd, Butter & Cheese, Bread & Eggs, Breakfast Cereal Jams.", contentURL : URL(string : "http://162.144.95.215/~dqbahrain/wp-content/uploads/2015/08/BigBreakfast2.png"), subContURL : [URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!, URL(string : "http://pngimg.com/upload/small/pineapple_PNG2733.png")!], subContName : ["23454","2","3","567"] )
    ]
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objOfDataClass.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ExpandedCell else {
            fatalError()
        }
        
        let tempObj = objOfDataClass[indexPath.row]
        cell.imageViewOutlet.kf.setImage(with: tempObj.contentImageURL)
        cell.lblHeading.text = tempObj.contentHeading
        cell.lblContents.text = tempObj.contentDescription
        cell.arrImageURL = tempObj.subContentImageURL
        cell.arrContentName = tempObj.subContentName
        cell.collectionViewOutlet.reloadData()
        
        if indexPath == selectedIndexPath {
            cell.backgroundColor = UIColor.yellow
            cell.btnUpDownOutlet.setImage(#imageLiteral(resourceName: "up"), for: .normal)
        } else {
            cell.backgroundColor = UIColor.white
            cell.btnUpDownOutlet.setImage(#imageLiteral(resourceName: "down"), for: .normal)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let previousIndexPath = selectedIndexPath
        
        if  indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else  {
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<IndexPath> = []
        
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        if indexPaths.count > 0 {
            tableView.reloadRows(at: indexPaths as [IndexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            var expandedHeight: Int = 106
            var count1: Int = 0
            
            var tempArray: [String]
            tempArray = objOfDataClass[indexPath.row].subContentName!
            
            count1 = tempArray.count
            
            var rows: Int = count1 / 3
            rows += (count1 % 3)
            expandedHeight = expandedHeight * rows
            if count1 <= 3 {
                print(expandedHeight)
                return 220
            } else {
                print(expandedHeight)
                return CGFloat(expandedHeight) + 100
            }
        } else {
            return ExpandedCell.defaultHeight
        }
    }
}






