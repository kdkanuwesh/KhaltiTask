//
//  Fields.swift
//  Task
//
//  Created by Anuwesh Khadka on 23/02/2023.
//

import Foundation

struct Fields : Codable {
    
	let label : String?
    
	let input_type : String?
    
	let name : String?
    
	let required : Bool?

	enum CodingKeys: String, CodingKey {

		case label = "label"
        
		case input_type = "input_type"
        
		case name = "name"
        
		case required = "required"
	}

	init(from decoder: Decoder) throws {
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		label = try values.decodeIfPresent(String.self, forKey: .label)
        
		input_type = try values.decodeIfPresent(String.self, forKey: .input_type)
        
		name = try values.decodeIfPresent(String.self, forKey: .name)
        
		required = try values.decodeIfPresent(Bool.self, forKey: .required)
	}

}
