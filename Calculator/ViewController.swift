//
//  ViewController.swift
//  Calculator
//
//  Created by Su Yuqing on 5/2/15.
//  Copyright (c) 2015 Su Yuqing. All rights reserved.
//

import UIKit

import Foundation

class ViewController: UIViewController {
 
   
    
    
    var calculateTVM = Double()
    
    var Fv = Double()
    
    var Pv = Double()
    
    var interest = Double()
    
    var numOfPeriods = Double()
    
    var pmt = Double()
    
    var firstOperand:Double = 0.0
    
    var sumOperand: Double = 0.0
    
    var cpt: Bool = false
    
    var operator1: String = "="
    
    var begin:Bool = true

    var backSpace: Bool = true;

    @IBOutlet weak var Answer: UILabel!
    

   
    
    @IBOutlet weak var showOperator: UILabel!
 

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnPressed (button: UIButton)
    {
        var label:String = button.currentTitle!;
        
        switch(label)
        {
            case "AC":
                pressClear()
                break;
            case "←":
                PressBackSpace()
        
            case "+","-","×","÷","=":
                binaryOperations(button.currentTitle!)
                break;
            case ".":
                addDot()
                break;
            
            case "+/-":
                pressSignBtn()
                break;
            
            case "x^2", "log","ln","e^x", "√x", "10^n","1/x", "sin(x)","cos(x)","tan(x)","%":
                
                singleOperations(button.currentTitle!)
            
                break;
            
            case "N", "PV", "FV", "PMT","I/Y":
                financialOperation(button.currentTitle!)
                break;
            case "mr", "m+":
                pressMBtn(button.currentTitle!)
                break;
            
            case "CPT":
                cptOpen()
                break;
            
            case"CLTVM":
                clearTVM()
                break;
            default:
                pressNumber(button.currentTitle!)
                break;
            
        
            
        }
    }
    
    func binaryOperations(var tag:String)
    {
        
        
        if(Answer.text != "")
        {
            firstOperand = StringToNumber(Answer.text!)
            
            if(begin)
            {
                operator1 = tag;
            }
            else
            {
                if(operator1 == "=")
                {
                    sumOperand = firstOperand;
                    
                }
                else if(operator1 == "+")
                {
                    sumOperand += firstOperand
                    
                    Answer.text = String(format: "%g", sumOperand);
                    
                }
                else if(operator1 == "-")
                {
                    sumOperand -= firstOperand
                    
                    Answer.text = String(format: "%g", sumOperand);
                }
                else if(operator1 == "×")
                {
                    sumOperand *= firstOperand
                    Answer.text = String(format: "%g", sumOperand);
                }
                else if(operator1 == "÷")
                {
                    if(firstOperand != 0)
                    {
                        sumOperand /= firstOperand
                        Answer.text = String(format: "%g", sumOperand);
                    }
                    else
                    {
                        Answer.text = "Error"
                        
                        operator1 = "="
                    }
                }
                
                begin = true
                operator1 = tag
                
            }
        }
    }
    
    func pressNumber(var tag:String)
    {
        backSpace = true
        cpt = false
        
        if(begin)
        {
            showOperator.text = ""
            Answer.text = tag
        }
        else
        {
            
            Answer.text = Answer.text! + tag;
            
        }
        
        begin = false
    }
    
    func pressClear()
    {
        Answer.text = "";
        showOperator.text = "";
        operator1 = "=";
        firstOperand = 0
        sumOperand = 0;
        cpt = false
        begin = true
        memoryPlus=0;
        sum=0;
    }
    
    func pressSignBtn ()
    {
       
        
        if Answer.text != "" && Answer.text != "0" && Answer.text != "-"
        {
            
             var answer: Double = StringToNumber(Answer.text!);
            
            answer = answer * (-1)
            
            Answer.text = String(format: "%g", answer)
            
            if(begin)
            {
                sumOperand = answer
            }
        }

        
            
    }
    

    func singleOperations (var tag:String)
    {
        showOperator.text = tag
        
        backSpace = false
        
        if(Answer.text != "")
        {
            
            operator1 = tag;
            
            firstOperand = StringToNumber(Answer.text!)
            
            
            if(operator1 == "x^2")
            {
                
                sumOperand = pow(firstOperand, 2)
        
                Answer.text = String(format: "%g", sumOperand)
            
                //Answer.text = "\(Answer.text!) "
            }
            else if(operator1 == "√x")
            {
                sumOperand = sqrt(firstOperand)
                
                Answer.text = String(format: "%g", sumOperand)
                
               // Answer.text = "\(Answer.text!) "
            }
            
            else if (operator1 == "log")
            {
                sumOperand = log10(firstOperand)
                
                Answer.text = String(format: "%g", sumOperand)
                
                //Answer.text = "\(Answer.text!) "
            }
            else if(operator1 == "ln")
            {
                
                
                sumOperand == log(firstOperand)
                
                Answer.text = String(format: "%g", sumOperand)
                
                
            }
            else if(operator1 == "e^x")
            {
                sumOperand = exp(firstOperand)
                
                Answer.text = String(format: "%g", sumOperand)
               
               // Answer.text = "\(Answer.text!) "
            }
            else if(operator1 == "%")
            {
                sumOperand = firstOperand/100
                
                Answer.text = String(format: "%g", sumOperand)
                
                //Answer.text = "\(Answer.text!) "
            }
            else if(operator1 == "10^n")
            {
                sumOperand = pow(10, firstOperand)
                
                Answer.text = String(format: "%g", sumOperand)
            }
            else if(operator1 == "1/x")
            {
                if(firstOperand != 0)
                {
                    sumOperand = 1 / firstOperand
                    Answer.text = String(format: "%g", sumOperand)
                }
                else
                {
                    Answer.text = "Error"
                }
            }
            else if(operator1 == "sin(x)")
            {
                sumOperand = sin(degreeToRadians(firstOperand))
                
                Answer.text = String(format: "%g", sumOperand)
            }
            else if(operator1 == "cos(x)")
            {
                sumOperand = cos(degreeToRadians(firstOperand))
                
                Answer.text = String(format: "%g", sumOperand)

            }
            else if(operator1 == "tan(x)")
            {
                sumOperand = tan(degreeToRadians(firstOperand))
                
                Answer.text = String(format: "%g", sumOperand)
            }
            
             begin = true
            
        }
        
       

    }
    

    
    var memoryPlus: Double = 0;
    var sum:Double=0;
    
    func pressMBtn (var tag: String)
    {
        showOperator.text = tag
        operator1 = tag
    
        
        if(operator1 == "mr")
        {
                
                pressNumber(String(format: "%g", sum))

            
            
            
        }
        else if(operator1 == "m+")
        {
            
            memoryPlus = StringToNumber(Answer.text!)
            println(memoryPlus)
            sum = sum + memoryPlus
            
        }

        begin=true
    }
    

    
    
    
    func cptOpen ()
    {
        showOperator.text = "CPT"
        
        cpt = true
    }
    
    
    
    func PressBackSpace()
    {
        
        
        
        if(backSpace)
        {
            if(count(Answer.text!) == 1)
            {
                Answer.text = ""
            }
            else if(count(Answer.text!) > 1)
            {
                
                let ss = Answer.text!
                
                let length = count(ss);
                
                let substringIndex = length - 1;
                
                Answer.text = ss.substringToIndex(advance(ss.startIndex, substringIndex))
            }
        }
    }
    
    
    

    func financialOperation(var tag:String){
        
        showOperator.text = tag
        showOperator.text = "\(showOperator.text!)="
        operator1 = tag
        backSpace = false
        
        if(cpt)
        {
            if(operator1 == "N")
            {
                calculateTVM = (log(((Fv * interest - pmt) / ((-Pv * interest) - pmt)))) / (log(1 + interest));
            }
            else if(operator1 == "I/Y")
            {
                
            }
            else if(operator1 == "PMT")
            {
                calculateTVM = (-Pv - Fv/pow(1 + interest/100, numOfPeriods))/((1 - 1/pow(1 + interest/100, numOfPeriods))/(interest/100));
            }
            else if(operator1 == "PV")
            {
                calculateTVM = -(Fv/pow(1 + interest/100, numOfPeriods) + (1 - 1/pow(1 + interest/100, numOfPeriods))/(interest/100) * pmt);
            }
            else if(operator1 == "FV")
            {
                calculateTVM = (-Pv - (1 - 1/pow(1 + interest/100, numOfPeriods))/(interest/100) * pmt) * pow(1 + interest/100, numOfPeriods);
            }
            
            
            Answer.text = String(format: "%.8f", calculateTVM);
            
            cpt = false
        }
        else
        {
            if(Answer.text != "")
            {
                firstOperand = StringToNumber(Answer.text!)
                
                if(operator1 == "N")
                {
                    
                    if(firstOperand >= 0 )
                    {
                        numOfPeriods = StringToNumber(Answer.text!)
                    }
                    else
                    {
                        Answer.text = "Error"
                    }
                }
                else if(operator1 == "I/Y")
                {
                    interest = StringToNumber(Answer.text!)
                }
                else if(operator1 == "PMT")
                {
                    pmt = StringToNumber(Answer.text!)
                }
                else if(operator1 == "PV")
                {
                    Pv = StringToNumber(Answer.text!)
                }
                else if(operator1 == "FV")
                {
                    Fv = StringToNumber(Answer.text!)
                }
            }
        }
        
        begin = true
    }
    
    
    func addDot()
    {
        
        
        if(Answer.text != "-" && Answer.text != "")
        {
            var s = Answer.text!
            
            if(!containsDot(s))
            {
                s = "\(s)."
                
                Answer.text = s
            }
            
        }
    }
    
    func clearTVM()
    {
        
        
        Fv = 0
        interest = 0
        pmt = 0
        Pv = 0
        numOfPeriods = 0
    }

    
    
    
}

