//
//  WebViewController.swift
//  Practica4
//
//  Created by Juan Carlos Díaz Torres on 07/11/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var pokedexModel: PokedexModel!
    var typeIndex: Int!
    var raceIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        let pokemon = pokedexModel.types[typeIndex].races[raceIndex].name
        print(pokemon)
        
        pokemonTitle.title = pokemon
        
        let s = "http://es.pokemon.wikia.com/wiki/\(pokemon)"
        let url = URL(string: s)!
        let req = URLRequest(url: url)
        
        webView.load(req)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
