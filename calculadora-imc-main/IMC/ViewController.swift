//
//  ViewController.swift
//  IMC
//
//  Created by Cristovão Lima on 30/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viPainel: UIView!
    var imc = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        if let peso = Double(tfPeso.text!), let altura = Double(tfAltura.text!){
            imc = peso / (altura * altura)
            showResult()
        }
    }
    
    func showResult(){
        var result = ""
        var resultImg = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                resultImg = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                resultImg = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                resultImg = "ideal"
            case 25..<30:
                result = "Sobre peso"
                resultImg = "sobre"
            default:
                result = "Obesidade"
                resultImg = "obesidade"
        }
        lbResult.text = "\(Int(imc)) - \(result)"
        ivResult.image = UIImage(named: resultImg)
        viPainel.isHidden = false
        view.endEditing(true)
    }
    
}

