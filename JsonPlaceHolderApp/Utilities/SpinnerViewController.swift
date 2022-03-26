//
//  SpinnerViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 25/03/2022.
//
import UIKit

class SpinnerViewController: UIViewController {

    var spinner = UIActivityIndicatorView(style: .large)
    override func loadView() {
        view = UIView()
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    

}
