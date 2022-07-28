import UIKit

public class TextRowTableViewCell: BaseTableViewCell<TextRow> {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // MARK: - Public methods
    
    public override func configure(with model: TextRow) {
        super.configure(with: model)
        
        titleLabel.font = model._font
        titleLabel.textColor = model._textColor
        titleLabel.textAlignment = model._textAlignment
        
        titleLabel.text = model.text
    }
    
    public override func loadView() {
        super.loadView()
        contentStackView.addArrangedSubview(titleLabel)
    }

}
