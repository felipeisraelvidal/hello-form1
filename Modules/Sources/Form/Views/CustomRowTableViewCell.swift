import UIKit

class CustomRowTableViewCell: BaseTableViewCell<CustomRow> {
    
    override func configure(with model: CustomRow) {
        super.configure(with: model)
        
        contentStackView.addArrangedSubview(model.content)
    }
    
    override func loadView() {
        super.loadView()
    }

}
