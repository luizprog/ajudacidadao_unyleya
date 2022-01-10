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
    
    var registro: Registro?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let registro = registro{
            title = "Edicao"
            textFieldNome.text = registro.nome
            textFieldEndereco.text = registro.endereco
            textViewDescricao.text = registro.descricao
            if let image = registro.mainimage {imageViewImagem.image = UIImage(data: image)}
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
        let alert = UIAlertController(title: "Selecione a imagem", message: "De onde deseja escolher a imagem?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let fotoAction = UIAlertAction(title: "Tirar foto", style: .default){_ in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction( fotoAction)
        }
        let albumAction = UIAlertAction(title: "Escolher do Album", style: .default){_ in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        let bibliotecaAction = UIAlertAction(title: "Escolher da Biblioteca", style: .default){_ in
            self.selectPicture(sourceType: .photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "Canceler", style: .cancel, handler: nil)
        
        alert.addAction( albumAction)
        alert.addAction( bibliotecaAction)
        
        alert.addAction( cancelAction)
        
        present(alert,animated: true, completion: nil)
    }
    func selectPicture(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func salvarCadastro(_ sender: UIButton) {
        if registro == nil {
            registro = Registro(context: context)
        }
        registro?.nome = textFieldNome.text
        registro?.endereco = textFieldEndereco.text
        registro?.descricao = textViewDescricao.text
        registro?.mainimage = imageViewImagem.image?.jpegData(compressionQuality: 0.9)
        
        try? context.save()
        navigationController?.popViewController(animated: true)
    }
    
}

extension RegistroFormViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageViewImagem.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}














