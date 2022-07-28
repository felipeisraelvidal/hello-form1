import UIKit
import CoreUI

class TextFieldRowTableViewCell: BaseTableViewCell<TextFieldRow> {
    
    // MARK: - Properties
    
    private var model: TextFieldRow?
    
    // MARK: - Views
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.fillSuperview(offset: 0)
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // MARK: - Public methods
    
    override func configure(with model: TextFieldRow) {
        super.configure(with: model)
        
        self.model = model
        
        textField.font = model.font
        textField.textColor = model.textColor
        textField.textAlignment = model.textAlignment
        textField.borderStyle = model._textFieldStyle
        textField.returnKeyType = model._returnKeyType
        textField.autocapitalizationType = model._autocapitalizationType
        textField.clearButtonMode = model._clearButtonMode
        textField.autocorrectionType = model._autocorrectionType
        
        textField.placeholder = model.placeholder
        
        textField.tintColor = model.tintColor
        
        model.text.bind { result in
            self.textField.text = result
        }
    }
    
    override func loadView() {
        super.loadView()
        contentStackView.addArrangedSubview(textField)
    }
    
    // MARK: - Private methods
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        model?.text.value = textField.text ?? ""
    }

}

extension TextFieldRowTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        
        textField.resignFirstResponder()
        model?.onSubmitAction?(text)
        
        return true
    }
    
}
