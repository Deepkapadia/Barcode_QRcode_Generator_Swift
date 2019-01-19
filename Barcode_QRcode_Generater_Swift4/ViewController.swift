//
//  ViewController.swift
//  Barcode_QRcode_Generater_Swift4
//
//  Created by DeEp KapaDia on 16/06/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DataField: UITextField!
    
    @IBOutlet weak var CodeSelectSeg: UISegmentedControl!
    
    @IBOutlet weak var ImageCodeView: UIImageView!
    
    var Filter:CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func GenerateBTN(_ sender: UIButton) {
        
        if let text = DataField.text{
            
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if CodeSelectSeg.selectedSegmentIndex == 0{
                
                Filter = CIFilter(name: "CICode128BarcodeGenerator")
                
            }else{
                
                Filter = CIFilter(name: "CIQRCodeGenerator")
                
            }
            
            Filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            let image = UIImage(ciImage: Filter.outputImage!.transformed(by: transform))
            
            ImageCodeView.image = image
        }
        
    }
    



}

