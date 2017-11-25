//
//  ViewController.swift
//  JesonParseExampleSwift3
//
//  Created by Admin on 03/09/1939 Saka.
//  Copyright © 1939 Saka Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    var TableDataArray:Array = Array<String>();
    var ModelArray = Array<ModelClass>();
    var model = ModelClass();
    private let cellId = "cell"
    let query = "dogs"
    lazy var endPoint: String = {
        return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=\(self.query)&nojsoncallback=1#"
    }();

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self;
        TableView.dataSource = self;
        TableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId);
        let service = ApiService()
        service.getDataWith(url: endPoint ){ (result) in
            switch result {
            case .Success(let data):
                self.clearData()
                self.saveInCoreDataWith(array: data)
            case .Error(let message):
                DispatchQueue.main.async {
                    self.showAlertWith(title: "Error", message: message)
                }
            }
        }
        
        
    }
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: title, style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    private func saveInCoreDataWith(array: [[String: AnyObject]]) {
        
    
        
            
            //var items = array["items"] as! [[String: AnyObject]];
            
          
             for i in 0  ..< array.count
            {
                let name = array[i]["title"];
                let desc = array[i]["description"];
                let img =  array[i]["link"];
                model = ModelClass(desc: desc as! String, title: name as! String, img: img as! String)
                
                ModelArray.append(model);
                
                
            }
           
            
            
            
            
        
       
        //swift 3
        DispatchQueue.main.async{
            self.TableView.reloadData()
        }
    }
    private func clearData() {
        ModelArray.removeAll();
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelArray.count;
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell;
        cell.descriptionLabel.text = ModelArray[indexPath.row].desc;
        cell.titleLabel.text = ModelArray[indexPath.row].title;
        //cell.ImageView.image = ModelArray[indexPath.row].image;
        
        
        return  cell;
    }

   
}
