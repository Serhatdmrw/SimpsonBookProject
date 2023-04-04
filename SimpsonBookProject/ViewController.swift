//
//  ViewController.swift
//  SimpsonBookProject
//
//  Created by Serhat Demir on 3.04.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var simpsonArray : [Simpson] = []
        
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addDelegates()
        
        let homer = Simpson(name: "Homer Simpson", job: "Nucler Safety", image: UIImage(named: "homer")!)
        let marge = Simpson(name: "Marge Simpson", job: "Housewifi", image: UIImage(named: "marge")!)
        let bart = Simpson(name: "Bart Simpson", job: "Student", image: UIImage(named: "bart")!)
        let lisa = Simpson(name: "Lisa Simpson", job: "Student", image: UIImage(named: "lisa")!)
        let maggie = Simpson(name: "Maggie Simpson", job: "Baby", image: UIImage(named: "maggie")!)
        simpsonArray.append(homer)
        simpsonArray.append(marge)
        simpsonArray.append(bart)
        simpsonArray.append(lisa)
        simpsonArray.append(maggie)
    }
}

// MARK: - Helpers
private extension ViewController {
    
    func addDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = simpsonArray[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        let selectedSimpson = Simpson(name: simpsonArray[indexPath.row].name, job: simpsonArray[indexPath.row].job, image: simpsonArray[indexPath.row].image)
        detailsViewController.selectedSimpson = selectedSimpson
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
