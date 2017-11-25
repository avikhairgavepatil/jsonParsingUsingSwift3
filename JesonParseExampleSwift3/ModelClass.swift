//
//  ModelClass.swift
//  JesonParseExampleSwift3
//
//  Created by Admin on 03/09/1939 Saka.
//  Copyright © 1939 Saka Admin. All rights reserved.
//

import Foundation
class ModelClass
{
    
    var desc = "";
    var title = "";
    var image =  "";
   
    init(desc:String,title:String,img:String)
    {
        
        self.desc = desc;
        self.title = title;
        self.image = img;
    }
 
    init()
    {
        
    }
    
}
