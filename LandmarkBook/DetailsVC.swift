//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Ali serkan Boyracı  on 17.09.2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet var landmarkLable: UILabel!
    
    @IBOutlet var iamgeView: UIImageView!
    
    var selectedLandmarkName = "" // when the other selected sth, this variable will change
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLable.text = selectedLandmarkName // this VC is enough to do anytthing
        iamgeView.image = selectedLandmarkImage
        
        
    }
    

}
