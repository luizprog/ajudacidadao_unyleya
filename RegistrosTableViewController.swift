//
//  MoviesTableViewController.swift
//  ajudacidadao
//
//  Created by user204576 on 1/9/22.
//

import UIKit
import CoreData

class RegistrosTableViewController: UITableViewController {
    
    var fetchedResultsController: NSFetchedResultsController<Registro>!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRegistros()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let registroViewController = segue.destination as? RegistroViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            registroViewController.registro = fetchedResultsController.object(at: indexPath)
        }
    }


    func loadRegistros(){
        let fetchRequest: NSFetchRequest<Registro> = Registro.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "nome", ascending:true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil)
        fetchedResultsController.delegate = self
        try? fetchedResultsController.performFetch()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RegistroTableViewCell else { return UITableViewCell() }

        let regitro = fetchedResultsController.object(at: indexPath)
        cell.configWith(regitro)
        
        //cell.imageViewPoster.image = UIImage(named: movie.image)
        return cell
    }
    	
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let registro = fetchedResultsController.object(at: indexPath)
            context.delete(registro)
            try? context.save()
            
        }
    }
  	
}


extension RegistrosTableViewController: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        tableView.reloadData()
    }
}
















