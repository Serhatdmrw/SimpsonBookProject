//
//  DetailsViewController.swift
//  SimpsonBookProject
//
//  Created by Serhat Demir on 3.04.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    // MARK: - Properties
    var selectedSimpson : Simpson?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
    }
}
