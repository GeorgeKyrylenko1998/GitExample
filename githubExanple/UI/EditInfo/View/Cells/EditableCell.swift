//
//  EditableCell.swift
//  githubExanple
//
//  Created by George Kyrylenko on 12/17/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class EditableCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var editText: UITextField!
    
    var type: CellTypes?
    
    weak var delegate: EditableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    @IBAction func textChange(_ sender: UITextField) {
        guard let type = type else {return}
        guard let text = sender.text else {return}
        delegate?.editText(type: type, text: text)
    }
}

protocol EditableCellDelegate: class{
    func editText(type: CellTypes, text: String)
}
