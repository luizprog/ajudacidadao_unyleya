//
//  MovieFormViewController.swift
//  ajudacidadao
//
//  Created by user204576 on 1/9/22.
//

import UIKit

class RegistroFormViewController: UIViewController {

    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var imageViewImagem: UIImageView!

    @IBOutlet weak var buttonForm: UIButton!
    
    @IBOutlet weak var titleCadastro: UINavigationItem!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            title = "Edicao"
            textFieldNome.text = movie.title
            textFieldEndereco.text = movie.categories
            textViewDescricao.text = movie.duration
            imageViewImagem.image = UIImage(named: movie.image)
            buttonForm.setTitle("Editar", for: .normal)
        }else{
            title = "Cadastro"
            textFieldNome.text = ""
            textFieldEndereco.text = ""
            textViewDescricao.text = ""
            imageViewImagem.image = UIImage(named: "")
            buttonForm.setTitle("Cadastrar", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func selectImage(_ sender: Any) {
    }
    
    @IBAction func salvarCadastro(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
