//
//  ViewController.swift
//  BeyramBenElghali
//
//  Created by Beyram on 11/13/17.
//  Copyright © 2017 Beyram. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    
    var teamone : [UIImage] = [#imageLiteral(resourceName: "Dortmund")  , #imageLiteral(resourceName: "RealMadrid") , #imageLiteral(resourceName: "Napoli")]
    var teamtwo : [UIImage] = [#imageLiteral(resourceName: "ManCity") , #imageLiteral(resourceName: "Liverpool") , #imageLiteral(resourceName: "Monaco")]
    var dates : [String] = ["21 Nov" , "21 Nov" , "21 Nov"]
    var times : [String] = ["6:00 PM" , "8:45 PM" , "8:45 PM"]
    
    @IBOutlet weak var tablev: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let teamo : UIImageView = cell?.viewWithTag(101) as! UIImageView
        let teamt : UIImageView = cell?.viewWithTag(102) as! UIImageView
        let date : UILabel = cell?.viewWithTag(103) as! UILabel
        let time : UILabel = cell?.viewWithTag(104) as! UILabel
        
        //let item = greves[indexPath.row]
        teamo.image = teamone[indexPath.row]
        teamt.image = teamtwo[indexPath.row]
        date.text = dates[indexPath.row]
        time.text = times[indexPath.row]
        return cell!
    }
    
    
    @IBAction func action(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSegue") {
            print("heree to comp")
            let parisVC = segue.destination as! ParisViewController
            parisVC.teamo = teamone[(tablev.indexPathForSelectedRow?.row)!]
            parisVC.teamt = teamtwo[(tablev.indexPathForSelectedRow?.row)!]
         //   parisVC.teamo = teamone[tablev.indexPathForSelectedRow?.row)!]
          //  parisVC.teamt
            /*
            compareVC.grev = greves[(tableviews.indexPathForSelectedRow?.row)!]*/
        }
    }
    


}

