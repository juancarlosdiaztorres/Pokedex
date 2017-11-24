//
//  TypesTableViewController.swift
//  Practica4
//
//  Created by Juan Carlos Díaz Torres on 06/11/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit

class TypesTableViewController: UITableViewController {

    var pokedexModel = PokedexModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexModel.types.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) esto estaba escrito antes, tengo que hacer el casting.
        let cell : TypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath) as! TypeTableViewCell

        // Cojo cada tipo y modifico las labels/imagen con type.whatever
        
        let type = pokedexModel.types[indexPath.row]
        cell.typeName?.text = type.name
        cell.numberOfRaces?.text = "\(type.races.count) races"
        cell.typeIcon?.image =   UIImage(named: pokedexModel.types[indexPath.row].icon)
        
        print("\(type.icon).png")

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goRace" {
            if let rtvc = segue.destination as? RacesTableViewController {
                rtvc.pokedexModel = pokedexModel
                let indexPath = tableView.indexPathForSelectedRow //Cojo la fila en la que he pulsado.
                
                rtvc.typeIndex = indexPath?.row
            }
        }
    }
    

}
