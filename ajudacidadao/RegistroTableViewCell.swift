//
//  MovieTableViewCell.swift
//  ajudacidadao
//
//  Created by user204576 on 1/9/22.
//

import UIKit

class RegistroTableViewCell: UITableViewCell {

    
    @IBOutlet weak var LabelNome: UILabel!
    @IBOutlet weak var LabelEndereco: UILabel!
    @IBOutlet weak var ImageViewMainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configWith(_ registro: Registro){
        LabelNome?.text = registro.nome
        LabelEndereco?.text = registro.endereco
        if let  image = registro.mainimage{
            ImageViewMainImage.image = UIImage(data: image)
            
        }
    }
}
