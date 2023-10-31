//
//  ViewController.swift
//  SaveNotes2
//
//  Created by STANISLAV STAJILA on 10/30/23.
//

import UIKit

public struct Dog: Codable{
    var color: String
    var name: String
    var age: Int
    
    //Designing a class have a coding vars only: String, Int, Double
    //var pic: String
}


class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var number = 8
    var d1: Dog?
    var dogs = [Dog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = defaults.integer(forKey: "theNumber")
        print("\(number)")
        
        //decoding an JSON to an object
        if let items = defaults.data(forKey: "theDog") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Dog.self, from: items) {
                d1 = decoded
            }
        }
        print(d1?.name)
        
        if let items2 = defaults.data(forKey: "Dogs") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Dog].self, from: items2) {
                dogs = decoded
            }
        }
        
        for a in dogs{
            print(a.name)
        }
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        defaults.set(20, forKey: "theNumber")
        
        var blah = Dog(color: "White", name: "Angel", age: 12)
        var bla = Dog(color: "Black", name: "Liam", age: 3)
        dogs.append(blah)
        dogs.append(bla)
        
        //encoding an object into JSON (Java Script Object Notation) saves name as a key for a value
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(blah) {
            defaults.set(encoded, forKey: "theDog")
        }
        let encoder2 = JSONEncoder()
        if let encoded = try? encoder.encode(dogs) {
            defaults.set(encoded, forKey: "Dogs")
            
        }
        
    }
    
}
