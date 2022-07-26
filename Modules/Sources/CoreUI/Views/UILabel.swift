import UIKit

extension UILabel: DeclarativeLabel {
    
    // MARK: - Initializers
    
    public convenience init(_ text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    // MARK: - Public methods
    
    @discardableResult
    public func setText(_ text: String) -> UILabel {
        self.text = text
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    @discardableResult
    public func setTextColor(_ color: UIColor) -> UILabel {
        self.textColor = color
        return self
    }
    
}
