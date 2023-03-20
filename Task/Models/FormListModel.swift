//
//  FormListModel.swift
//  Task
//
//  Created by Anuwesh Khadka on 23/02/2023.
//

import Foundation

struct FormListModel : Codable {
    
	let fields : [Fields]?

	enum CodingKeys: String, CodingKey {

		case fields = "form_fields"
	}

	init(from decoder: Decoder) throws {
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
        fields = try values.decodeIfPresent([Fields].self, forKey: .fields)
	}

}
