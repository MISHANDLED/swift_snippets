//
//  model.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import Foundation


//struct UserModel : Codable{
//    var userName : String?
//    var userPost : String?
//}


struct ApiModel : Codable {
    
    var page : Int?
    var per_page : Int?
    var total : Int?
    var total_pages : Int?
    var data : [data]?
    var support : SupportInfo?
    
    struct data : Codable{
        var id : Int?
        var email : String?
        var first_name : String?
        var last_name : String?
        var avatar : String?
    }
    
    struct SupportInfo : Codable{
        var url : String?
        var text : String?
    }
    
}
