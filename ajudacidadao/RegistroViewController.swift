//
//  ViewController.swift
//  ajudacidadao
//
//  Created by user204576 on 1/8/22.
//

import UIKit

class RegistroViewController: UIViewController {
    
    @IBOutlet weak var descricaoProblemaLabel: UITextView!
    @IBOutlet weak var enderecoProblemaLabel: UILabel!
    @IBOutlet weak var imagemProblemaImage: UIImageView!
    @IBOutlet weak var nomeDenuncianteLabel: UILabel!
    var registro: Registro?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let registroFormViewController = segue.destination as? RegistroFormViewController{
            registroFormViewController.registro = registro
        }
    }

    func prepareScreen(){
        if let registro = registro{
            descricaoProblemaLabel.text = registro.descricao
            enderecoProblemaLabel.text = registro.endereco
            nomeDenuncianteLabel.text = registro.nome
            if let image = registro.mainimage{imagemProblemaImage.image = UIImage(data: image)}
        }
        
    }
    
    

}

