//: Playground - noun: a place where people can play

import UIKit

var city = "Oakland"
var queryConstructorOne = "http://www.weather-forecast.com/locations/"
var queryConstructorTwo = "/forecasts/latest"
var query = queryConstructorOne + city + queryConstructorTwo
let urlEndpoint = NSURL(string: query)

let task = NSURLSession.sharedSession().dataTaskWithURL(urlEndpoint!) { (data, response, error) -> Void in
    // Will happen when task is completed (aka closure)
    if let urlContent = data {
        let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            print(webContent)
        })
    }
}

task.resume()

//dont know why it dont work
