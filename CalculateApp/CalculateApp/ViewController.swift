//
//  ViewController.swift
//  CalculateApp
//
//  Created by BE X on 05/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    var working : String = ""
    @IBOutlet weak var CalculterWorking: UILabel!
    @IBOutlet weak var CalculterResults: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    func clearAll(){
        working=""
        CalculterWorking.text=""
        CalculterResults.text=""
    }
    

    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    func addtoWorking(value:String){
        working=working+value
        CalculterWorking.text=working
    }
    
    @IBAction func Backtab(_ sender: Any) {
        if (!working.isEmpty) {
            working.removeLast()
            CalculterWorking.text=working
        }
    }
    @IBAction func precentTap(_ sender: Any) {
        addtoWorking(value:"%")
    }
    @IBAction func DevisionTap(_ sender: Any) {
        addtoWorking(value:"/")

    }
    @IBAction func MultiTap(_ sender: Any) {
        addtoWorking(value:"*")

    }
    @IBAction func MainsTap(_ sender: Any) {
        addtoWorking(value:"-")

    }
    @IBAction func addTap(_ sender: Any) {
        addtoWorking(value:"+")

    }
    @IBAction func equalTap(_ sender: Any) {
        if VaildInput() {
     let checkworkingforprecntge=working.replacingOccurrences(of: "%", with: "*0.01")
     let expristion = NSExpression(format: checkworkingforprecntge)
     let results = expristion.expressionValue(with: nil, context: nil) as! Double
     let resultString = formatResults(result:results)
        CalculterResults.text = resultString
        }
        else{
            
            let  alert = UIAlertController(title:"Invalid input", message: "Calcultor unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func VaildInput() -> Bool {
        var count=0
        var indx=[Int]()
        for char in working {
            if (spchar(char:char)) {
                indx.append(count)
            }
            count+=1
        }
        var previous : Int = -1
        for index in indx {
            if (index==0) {
                return false
            }
            if (index == working.count-1) {
                return false
            }
            if (previous != -1) {
                if (index-previous == 1) {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    func spchar(char:Character) -> Bool {
        if (char=="*") {
            return true
        }
        if (char=="/") {
            return true
        }
        if (char=="+") {
            return true
        }
        
        return false
    }
    func formatResults(result:Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1)==0) {
            return String(format: "%0.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    @IBAction func one(_ sender: Any) {
        addtoWorking(value:"1")

    }
    @IBAction func two(_ sender: Any) {
        addtoWorking(value:"2")

    }
    @IBAction func three(_ sender: Any) {
        addtoWorking(value:"3")

    }
    @IBAction func four(_ sender: Any) {
        addtoWorking(value:"4")

    }
    @IBAction func five(_ sender: Any) {
        addtoWorking(value:"5")

    }
    @IBAction func six(_ sender: Any) {
        addtoWorking(value:"6")

 }
    
    @IBAction func seven(_ sender: Any) {
        addtoWorking(value:"7")

    }
    
    
    @IBAction func eight(_ sender: Any) {
        addtoWorking(value:"8")

    }
    
    @IBAction func nine(_ sender: Any) {
        addtoWorking(value:"9")

    }
    
    @IBAction func point(_ sender: Any) {
        addtoWorking(value:".")

    }
    
    @IBAction func zero(_ sender: Any) {
        addtoWorking(value:"0")

    }
}
    


