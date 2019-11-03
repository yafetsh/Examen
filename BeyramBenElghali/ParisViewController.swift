//
//  ParisViewController.swift
//  BeyramBenElghali
//
//  Created by Beyram on 11/13/17.
//  Copyright © 2017 Beyram. All rights reserved.
//

import UIKit
import CoreData

class ParisViewController: UIViewController {

    
    @IBOutlet weak var slidvvv: UILabel!
    
    var teamo : UIImage! = nil
    
    var teamt : UIImage! = nil
    var slV : Int?
    @IBOutlet weak var teamOne: UIImageView!
    @IBOutlet weak var teamTwo: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamOne.image = teamo
        teamTwo.image = teamt
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slidechange(_ sender: Any) {
        let currentValue = Int(slider.value)
        slV = currentValue
        slidvvv.text = "\(currentValue) $"
    }
    
    
    @IBAction func miser(_ sender: Any) {
        var one : String = ""
        var two : String = ""
        let currentValue = Int(slider.value)
        
        switch teamo {
        case #imageLiteral(resourceName: "Dortmund") :
            one = "Dortmund"
            break
            
        case #imageLiteral(resourceName: "RealMadrid") :
            one = "RealMadrid"
            break
            
        case #imageLiteral(resourceName: "Napoli") :
            one = "Napoli"
            break
            
        case #imageLiteral(resourceName: "Liverpool") :
            one = "Liverpool"
            break
            
        case #imageLiteral(resourceName: "ManCity") :
            one = "ManCity"
            break
            
        case #imageLiteral(resourceName: "Monaco") :
            one = "Monaco"
            break
        default:
            print("1")
        }
        
        switch teamt {
        case #imageLiteral(resourceName: "Dortmund") :
            two = "Dortmund"
            break
            
        case #imageLiteral(resourceName: "RealMadrid") :
            two = "RealMadrid"
            break
            
        case #imageLiteral(resourceName: "Napoli") :
            two = "Napoli"
            break
            
        case #imageLiteral(resourceName: "Liverpool") :
            two = "Liverpool"
            break
            
        case #imageLiteral(resourceName: "ManCity") :
            two = "ManCity"
            break
            
        case #imageLiteral(resourceName: "Monaco") :
            two = "Monaco"
            break
        default:
            print("2")
        }
        
        
        var type : String = ""
        switch segment.selectedSegmentIndex {
        case 0:
            type = "1"
            break
            
        case 1:
            type = "X"
            break
            
        case 2:
            type = "2"
            break
            
        default:
            type = "0"
        }
        print("\(currentValue)  " + one + " " + two + type)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let coreContext = appDelegate?.persistentContainer.viewContext
        let itemEntityDescription = NSEntityDescription.entity(forEntityName: "Paris", in: coreContext!)
        let item = NSManagedObject(entity: itemEntityDescription!, insertInto: coreContext)
        item.setValue(one , forKey: "teamo")
        item.setValue(two , forKey: "teamt")
        //item.setValue(currentValue ,forKey: "prix")
        item.setValue("\(currentValue)  ", forKey: "prix")
        item.setValue(type, forKey: "type")
        
        do {
            try coreContext?.save()
            print("saved")
            
        } catch let error as NSError {
            print(error.userInfo)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
