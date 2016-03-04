//
//  ViewController.swift
//  swift-web-request
//
//  Created by Admin on 04/03/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://swapi.co/api/people/1/"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string:urlString)
        
        session.dataTaskWithURL(url!){
            (data:NSData?, response:NSURLResponse?, error:NSError?)->Void in
            
            if let data = data{
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    
                    if let dict = json as? Dictionary<String, AnyObject>{
                        if let name = dict["name"] as? String, let  height = dict["height"] as? String, let birth = dict["birth_year"] as? String, let hair = dict["hair_color"] as? String{
                            
                            let person = SWperson(name: name, height: height, birthYear: birth, hairColor: hair)
                            
                            print(person.name)
                            print(person.birthYear)
                            print(person.height)
                            print(person.hairColor)
                        }
                    }
                    
                    
                } catch{
                    print("Could not serialize")
                }
                
            }
            
            }.resume()
    }
    
    
    
}

