//
//  HomeDataModel.swift
//  Task
//
//  Created by Anuwesh Khadka on 14/03/2023.
//

import Foundation
import UIKit

struct HomeDataModel {

    var sectionTitle: String?

    var items: [KhaltiModel]

}

struct KhaltiModel {

    var icon: UIImage

    var title: String

    var cashback: Bool = false

}

let HomeItems: [HomeDataModel] = [
    
    HomeDataModel(sectionTitle: nil, items: [

        KhaltiModel(icon: UIImage(named: "ad1")!, title: "ad1"),

    ]),

    //

    HomeDataModel(sectionTitle: "Other Services", items: [

        KhaltiModel(icon: UIImage(named: "Club & Membership")!, title: "Club & Membership"),

        KhaltiModel(icon: UIImage(named: "Daily Essentials")!, title: "Daily Essentials"),

        KhaltiModel(icon: UIImage(named: "Education")!, title: "Education"),

        KhaltiModel(icon: UIImage(named: "Health")!, title: "Health"),

        KhaltiModel(icon: UIImage(named: "Social Cause")!, title: "Social Cause"),

        KhaltiModel(icon: UIImage(named: "Travel & Tourism")!, title: "Travel & Tourism"),

        KhaltiModel(icon: UIImage(named: "Vendor")!, title: "Vendor"),

    ]),
    
    HomeDataModel(sectionTitle: nil, items: [

        KhaltiModel(icon: UIImage(named: "ad2")!, title: "ad2"),
        
        KhaltiModel(icon: UIImage(named: "ad3")!, title: "ad3"),

    ]),

    HomeDataModel(sectionTitle: "Insurance Services", items: [

        KhaltiModel(icon: UIImage(named: "Bike:Car Insurance")!, title: "Bike/Car Insurance"),

        KhaltiModel(icon: UIImage(named: "DOFE Insurance")!, title: "DOFE Insurance"),

        KhaltiModel(icon: UIImage(named: "DOFE Welfare")!, title: "DOFE Welfare"),

        KhaltiModel(icon: UIImage(named: "Reliable Surakshit Jeevan Beema")!, title: "Reliable Surakshit Jeevan Beema")

    ]),

    HomeDataModel(sectionTitle: "Registration & Enrollments", items: [

        KhaltiModel(icon: UIImage(named: "3rd National Cooperative Congress")!, title: "3rd National Cooperative Congress"),

        KhaltiModel(icon: UIImage(named: "Girls On Wheel 4.0")!, title: "Girls On Wheel 4.0"),

        KhaltiModel(icon: UIImage(named: "Lyrical battle")!, title: "Lyrical battle"),

        KhaltiModel(icon: UIImage(named: "Mr Nepal Registration")!, title: "Mr Nepal Registration"),

        KhaltiModel(icon: UIImage(named: "Mr. & Miss Nepal")!, title: "Mr. & Miss Nepal"),

        KhaltiModel(icon: UIImage(named: "Runway dreams III")!, title: "Runway dreams III"),


    ]),

    HomeDataModel(sectionTitle: "Popular Services", items: [

        KhaltiModel(icon: UIImage(named: "IDP Ielts")!, title: "IDP Ielts"),

        KhaltiModel(icon: UIImage(named: "Kathmandu Metropolitan City")!, title: "Kathmandu Metropolitan City"),

        KhaltiModel(icon: UIImage(named: "Mero Lagani")!, title: "Mero Lagani"),

        KhaltiModel(icon: UIImage(named: "NAME")!, title: "NAME"),

        KhaltiModel(icon: UIImage(named: "National Life Insurance")!, title: "National Life Insurance"),

        KhaltiModel(icon: UIImage(named: "PEA")!, title: "PEA"),

        KhaltiModel(icon: UIImage(named: "QFX")!, title: "QFX"),

        KhaltiModel(icon: UIImage(named: "Vibrant MBBS Entrance Preparation")!, title: "Vibrant MBBS Entrance Preparation"),


    ]),

    HomeDataModel(sectionTitle: "Popular Government Services", items: [

        KhaltiModel(icon: UIImage(named: "Bluebook Renew")!, title: "Bluebook Renew"),

        KhaltiModel(icon: UIImage(named: "Dofe WelFare")!, title: "Dofe WelFare"),

        KhaltiModel(icon: UIImage(named: "EPS Korea Management Fee")!, title: "EPS Korea Management Fee"),

        KhaltiModel(icon: UIImage(named: "IRD")!, title: "IRD"),

        KhaltiModel(icon: UIImage(named: "No Objection Letter")!, title: "No Objection Letter"),

        KhaltiModel(icon: UIImage(named: "NTC Vacancy")!, title: "NTC Vacancy"),

        KhaltiModel(icon: UIImage(named: "Social Security Funds")!, title: "Social Security Funds"),

        KhaltiModel(icon: UIImage(named: "Traffic Police Fine Payment")!, title: "Traffic Police Fine Payment"),


    ]),

    HomeDataModel(sectionTitle: "Recently Added Services", items: [

        KhaltiModel(icon: UIImage(named: "Balaju Ticketing")!, title: "Balaju Ticketing"),

        KhaltiModel(icon: UIImage(named: "Central Zoo")!, title: "Central Zoo"),

        KhaltiModel(icon: UIImage(named: "Eastlink Cloud Pvt Ltd")!, title: "Eastlink Cloud Pvt Ltd"),

        KhaltiModel(icon: UIImage(named: "Entrance Payment for Master in Data Science")!, title: "Entrance Payment for Master in Data Science"),

        KhaltiModel(icon: UIImage(named: "Galaxy Public School Pvt. Ltd")!, title: "Galaxy Public School Pvt. Ltd"),

        KhaltiModel(icon: UIImage(named: "Microsoft 365")!, title: "Microsoft 365"),

        KhaltiModel(icon: UIImage(named: "Pabson")!, title: "Pabson"),

        KhaltiModel(icon: UIImage(named: "Ratnaapark Ticketing")!, title: "Ratnaapark Ticketing"),

        KhaltiModel(icon: UIImage(named: "Rotoract Club of Damauli")!, title: "Rotoract Club of Damauli"),


    ]),

    HomeDataModel(sectionTitle: "Send Money to Vendor", items: [

        KhaltiModel(icon: UIImage(named: "IT Karkhana")!, title: "IT Karkhana"),

        KhaltiModel(icon: UIImage(named: "M. R. Publication and Distribution")!, title: "M. R. Publication and Distribution"),

        KhaltiModel(icon: UIImage(named: "Mithlesh Mobile")!, title: "Mithlesh Mobile"),

        KhaltiModel(icon: UIImage(named: "RR Mobile")!, title: "RR Mobile"),

        KhaltiModel(icon: UIImage(named: "SMM Nepal")!, title: "SMM Nepal"),

        KhaltiModel(icon: UIImage(named: "Sparrow SMS")!, title: "Sparrow SMS"),

        KhaltiModel(icon: UIImage(named: "Swift Holidays")!, title: "Swift Holidays"),

        KhaltiModel(icon: UIImage(named: "Veda")!, title: "Veda"),


    ]),
    
    HomeDataModel(sectionTitle: nil, items: [

        KhaltiModel(icon: UIImage(named: "ad4")!, title: "ad4"),
        
        KhaltiModel(icon: UIImage(named: "ad5")!, title: "ad5"),

    ]),

    HomeDataModel(sectionTitle: "We're accepted Online At", items: [

        KhaltiModel(icon: UIImage(named: "Ecommerce")!, title: "Ecommerce"),

        KhaltiModel(icon: UIImage(named: "Financial, Brokers and Capitals")!, title: "Financial, Brokers and Capitals"),

        KhaltiModel(icon: UIImage(named: "Food Delivery ")!, title: "Food Delivery "),

        KhaltiModel(icon: UIImage(named: "Games, Entertainment and Gifting")!, title: "Games, Entertainment and Gifting"),

        KhaltiModel(icon: UIImage(named: "Goverment services")!, title: "Goverment services"),

        KhaltiModel(icon: UIImage(named: "IT and web-hosting")!, title: "IT and web-hosting"),

        KhaltiModel(icon: UIImage(named: "Movies")!, title: "Movies"),

    ]),
    
    HomeDataModel(sectionTitle: nil, items: [

        KhaltiModel(icon: UIImage(named: "ad5")!, title: "ad5"),

    ]),
    
    HomeDataModel(sectionTitle: "We're accepted Online At", items: [

        KhaltiModel(icon: UIImage(named: "Ecommerce")!, title: "Ecommerce"),

        KhaltiModel(icon: UIImage(named: "Financial, Brokers and Capitals")!, title: "Financial, Brokers and Capitals"),

        KhaltiModel(icon: UIImage(named: "Food Delivery ")!, title: "Food Delivery "),

        KhaltiModel(icon: UIImage(named: "Games, Entertainment and Gifting")!, title: "Games, Entertainment and Gifting"),

        KhaltiModel(icon: UIImage(named: "Goverment services")!, title: "Goverment services"),

        KhaltiModel(icon: UIImage(named: "IT and web-hosting")!, title: "IT and web-hosting"),

        KhaltiModel(icon: UIImage(named: "Movies")!, title: "Movies"),

    ]),
    
]

