//
//  ViewController.swift
//  briova-swift
//
//  Created by Patel, Henvy on 9/18/18.
//  Copyright © 2018 Patel, Henvy. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refillBtn: UIButton!
    @IBOutlet weak var greetingMsg: UILabel!
    
    let pillImage = ["pill-bottle","pill-spray","pill-reg","pill-inject","pill-spray","pill-spray"]
    let pillName = ["Acetaminophen","Lisinopril","Prilosec","Amoxicillin","Glucophage","something"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pillImage.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // code to index the last cell in the table to be different
//        let num = tableView.numberOfRows(inSection: indexPath.section)
//        if indexPath.row == num - 1  {
//            let cell =  tableView.dequeueReusableCell(withIdentifier: "refillButton", for: indexPath)
//            return cell
        //        }else{ }
        let cell =  tableView.dequeueReusableCell(withIdentifier: "medicationCell", for: indexPath) as! MedCell
        cell.medImage.image =  UIImage(named: pillImage[indexPath.row] + ".png")
        cell.medName.text = pillName[indexPath.row]
      
        let detailscolor = hexStringToUIColor(hex: "#930FA5");
        let archivecolor = hexStringToUIColor(hex: "#5E82A3");
        cell.rightButtons = [MGSwipeButton(title: "Archive", backgroundColor: archivecolor),
                             MGSwipeButton(title: "Details",backgroundColor: detailscolor)]
        cell.rightSwipeSettings.transition = .static
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
        }
        else {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    func addNavBarImage(){
        
        let image : UIImage = UIImage(named: "briova.png")!
        let imageView = UIImageView(frame: CGRect(x: 0 , y: 0, width: 1 , height:1))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updateGreetingMsg() // updates greeting message
        self.tableView.layer.cornerRadius = 10.0
        self.tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // rounded corners
        self.refillBtn.layer.cornerRadius = 10.0
        self.refillBtn.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        addNavBarImage() // adds the briova title
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func updateGreetingMsg(){
        let date = NSDate()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!
        var timeofDay = " "
        if hourInt >= 12 && hourInt <= 16 {
            timeofDay = "Good Afternoon"
        }
        else if (hourInt >= 7 && hourInt <= 12 || hourInt >= 0 && hourInt <= 7)  {
            timeofDay = "Good Morning"
        }
        else if hourInt >= 16 && hourInt <= 20 {
            timeofDay = "Good Evening"
        }
        else if hourInt >= 20 && hourInt <= 24 {
            timeofDay = "Good Night"
        }
    
        greetingMsg.text = timeofDay + ", Jane!"
        
    }


}

