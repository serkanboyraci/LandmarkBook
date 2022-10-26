//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ali serkan Boyracı  on 15.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    

    @IBOutlet var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
   
    // to give a variable to seleceted item.
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //better way to using this is available but , we will see in next lessons.
        
        landmarkNames.append("Antep")
        landmarkNames.append("İstanbul")
        landmarkNames.append("İzmir")
        landmarkNames.append("Siirt")
        landmarkNames.append("Urfa")
        
        
        landmarkImages.append(UIImage(named:"antep")!)
        landmarkImages.append(UIImage(named:"istanbul")!)
        landmarkImages.append(UIImage(named:"izmir")!)
        landmarkImages.append(UIImage(named:"siirt")!)
        landmarkImages.append(UIImage(named:"urfa")!)
        
        
        
        
    }
 // If you use tbaleviewdelegate and datasource you have to use 2 functions.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count     //to give exact number limits us, so we can give the exac number of landmarks
        
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // to use cell in table view
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration() //after IOS 16, you must use this class
        content.text = landmarkNames[indexPath.row] //to give landmarks names.
        //content.image = landmarkImages[indexPath.row] no need to use now
        cell.contentConfiguration = content
        // cell.textLabel?.text = "test" // cannot use after IOS16
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row] //to give varibale selected item
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    //before segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName //to transfer selected data
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row) // to remove selectedrow
            self.landmarkImages.remove(at: indexPath.row)
            //after deleting items will come when reset the program.
            tableView.deleteRows(at: [indexPath], with: .fade) //only seleceted item deleted.
        }
    }
    
    


}

