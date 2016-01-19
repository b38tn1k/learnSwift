//
//  ViewController.swift
//  What is the Weather Like
//
//  Created by James Carthew on 14/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textOutput: UILabel!
    @IBOutlet var textInput: UITextField!
    
    @IBAction func findWeather(sender: AnyObject) {
        let city = String(textInput.text!)
        let queryConstructorOne = "http://www.weather-forecast.com/locations/"
        let queryConstructorTwo = "/forecasts/latest"
        let query = queryConstructorOne + city.stringByReplacingOccurrencesOfString(" ", withString: "-") + queryConstructorTwo
        let attemptedURLEndpoint = NSURL(string: query)
        var wasSuccessful = false
        if let urlEndpoint = attemptedURLEndpoint {
            let task = NSURLSession.sharedSession().dataTaskWithURL(urlEndpoint) { (data, response, error) -> Void in
                if let urlContent = data {
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    if websiteArray!.count > 1 {
                        let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                        if weatherArray.count > 1 {
                            wasSuccessful = true
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.textOutput.text = "Weather for \(city.capitalizedString): " + weatherSummary
                            })
                        }
                    }
                    if wasSuccessful == false {
                        self.textOutput.text = "Could not find Weather for \(city.capitalizedString)."
                    }
                }
            }
            task.resume()
        } else {
            self.textOutput.text = "Could not find Weather for \(city.capitalizedString)."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textOutput.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tapping outside the keyboard closes keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // hitting return dismisses keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool  {
        textInput.resignFirstResponder()
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

