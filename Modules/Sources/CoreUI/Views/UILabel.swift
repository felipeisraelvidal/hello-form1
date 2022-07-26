import UIKit

extension UILabel: DeclarativeLabel {
    
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
