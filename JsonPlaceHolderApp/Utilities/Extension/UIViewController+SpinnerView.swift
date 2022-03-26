//
//  UIViewController+SpinnerView.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 25/03/2022.
//
import UIKit

fileprivate let spinner = SpinnerViewController()
extension UIViewController{
    
    func startIndicator(alpha : CGFloat = 0.4){
        spinner.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        self.addChild(spinner)
        spinner.view.frame = self.view.frame
        self.view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    func startIndicatorFromModal(alpha : CGFloat = 0.4){
        spinner.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        self.addChild(spinner)
        spinner.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    func stopIndicator(){
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
}
