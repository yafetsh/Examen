//
//  BultViewController.swift
//  BeyramBenElghali
//
//  Created by Beyram on 11/13/17.
//  Copyright © 2017 Beyram. All rights reserved.
//

import UIKit
import CoreData

class BultViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    var lists : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCellTwo")
            let image : UIImageView = cell?.viewWithTag(301) as! UIImageView
            let imaget : UIImageView = cell?.viewWithTag(302) as! UIImageView
            let title : UILabel = cell?.viewWithTag(303) as! UILabel
            let desc : UILabel = cell?.viewWithTag(304) as! UILabel
            
            let item = lists[indexPath.row]
            
            switch item.value(forKey: "teamo") as! String {
            case "Dortmund":
                image.image = #imageLiteral(resourceName: "Dortmund")
                break
                
            case "Napoli":
                image.image = #imageLiteral(resourceName: "Napoli")
                break
                
            case "RealMadrid":
                image.image = #imageLiteral(resourceName: "RealMadrid")
                break
                
            case "Liverpool":
                image.image = #imageLiteral(resourceName: "Liverpool")
                break
                
            case "ManCity":
                image.image = #imageLiteral(resourceName: "ManCity")
                break
                
            case "Monaco":
                image.image = #imageLiteral(resourceName: "Monaco")
                break

            default:
                print("nothing")
            }
            
            switch item.value(forKey: "teamt") as! String {
            case "Dortmund":
                imaget.image = #imageLiteral(resourceName: "Dortmund")
                break
                
            case "Napoli":
                imaget.image = #imageLiteral(resourceName: "Napoli")
                break
                
            case "RealMadrid":
                imaget.image = #imageLiteral(resourceName: "RealMadrid")
                break
                
            case "Liverpool":
                imaget.image = #imageLiteral(resourceName: "Liverpool")
                break
                
            case "ManCity":
                imaget.image = #imageLiteral(resourceName: "ManCity")
                break
                
            case "Monaco":
                imaget.image = #imageLiteral(resourceName: "Monaco")
                break
                
            default:
                print("nothing")
            }
            
            title.text = "Result : \(item.value(forKey: "type") as! String)"
            desc.text = "Prix \(item.value(forKey: "prix") as! String) $"
            return cell!
    }

    func loadItems() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let coreContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Paris")
        do {
            lists = try coreContext!.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.userInfo)
        }
    }

}
