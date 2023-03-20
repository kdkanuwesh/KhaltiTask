//
//  UserDefaultManager.swift
//  Task
//
//  Created by Anuwesh Khadka on 27/02/2023.
//

import Foundation
import UIKit

class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    
    
    let userDefault = UserDefaults.standard

    var isReported : Bool {
        
        get {
            
            if let model: Bool = getModel(key: "IS_REPORTED") {
                
                return model
            }
            
            return false
            
        }set {
            
            saveModel(model: newValue, key: "IS_REPORTED")
        }
    }
    
    var incidentId : String {
        
        get {
            
            if let model: String = getModel(key: "INCIDENT_ID") {
                
                return model
                
            }
            
            return ""
            
        }set {
            
            saveModel(model: newValue, key: "INCIDENT_ID")
        }
    }
    
    var isBiometricsEmabled : Bool {
        
        get {
            
            if let model: Bool = getModel(key: "BIOMETRICS") {
                
                return model
            }
            
            return false
            
        }set {
            
            saveModel(model: newValue, key: "BIOMETRICS")
        }
    }
    
    var email : String {
        
        get {
            
            if let model: String = getModel(key: "EMAIL") {
                
                return model
                
            }
            
            return ""
            
        }set {
            
            saveModel(model: newValue, key: "EMAIL")
        }
    }
    
    var password : String {
        
        get {
            
            if let model: String = getModel(key: "PASSWORD") {
                
                return model
                
            }
            
            return ""
            
        }set {
            
            saveModel(model: newValue, key: "PASSWORD")
        }
    }

    //MARK:- Saving and retrieving user model
    private func saveModel<T: Codable> (model : T, key: String) {
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(model) {
            
            userDefault.set(encoded, forKey: key)
        }
    }
    
    private func getModel<T: Codable> (key: String) -> T? {
        
        if let model = userDefault.object(forKey: key) as? Data {
            
            let decoder = JSONDecoder()
            
            if let model = try? decoder.decode(T.self, from: model) {
                
                return model
            }
        }
        return nil
    }

}


protocol ManagebleObject {
    
    var id: String {get}
}
    
    



