//
//  RacesTableViewController.swift
//  Practica4
//
//  Created by Juan Carlos Díaz Torres on 06/11/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit

class RacesTableViewController: UITableViewController {
    
    /* Variables que me pasa por segue */
    var pokedexModel: PokedexModel!
    var typeIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(typeIndex)")
        title = pokedexModel.types[typeIndex].name
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokedexModel.types[typeIndex].races.count // cuento los races
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raceCell", for: indexPath)
        
        
        let type = pokedexModel.types[typeIndex]
        let race = type.races[indexPath.row]
        cell.textLabel?.text = race.name
        cell.detailTextLabel?.text = "\(race.code)"
        cell.detailTextLabel?.textColor = UIColor.red
        
        cell.imageView?.image = UIImage(named: race.icon)
        /*
        let iconNameSize = "\(race.code)".count
        let iconName: String!
        if iconNameSize == 1 {
            iconName = "races/00\(race.code).png"
        } else if iconNameSize == 2 {
            iconName = "races/0\(race.code).png"
        }else {
            iconName = "races/\(race.code).png"
        }
        
        cell.imageView?.image = UIImage(named: iconName)
        print(iconName)*/
        
        
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
        if segue.identifier == "GoWeb" {
            if let wvc = segue.destination as? WebViewController{
                
                wvc.pokedexModel = pokedexModel
                // pokemon que debe mostrar
                let indexPathPokemon = tableView.indexPathForSelectedRow
                wvc.raceIndex = indexPathPokemon?.row
                wvc.typeIndex = typeIndex
            }
        }
    }

}
