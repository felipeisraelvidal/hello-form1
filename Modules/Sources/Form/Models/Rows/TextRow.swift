import UIKit

public final class TextRow: Row, TextRowModifier {
    private(set) var text: String
    
    private(set) var font: UIFont = .preferredFont(forTextStyle: .body)
    private(set) var textColor: UIColor = .label
    private(set) var textAlignment: NSTextAlignment = .natural
    
    public init(
        _ text: String,
        image: UIImage? = nil
    ) {
        self.text = text
        
        super.init(image: image)
    }
    
    // MARK: - Modifiers
    
    @discardableResult
    public func setFont(_ font: UIFont) -> TextRow {
        self.font = font
        return self
    }
    
    @discardableResult
    public func setTextColor(_ color: UIColor) -> TextRow {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func setTextAlignment(_ alignment: NSTextAlignment) -> TextRow {
        self.textAlignment = alignment
        return self
    }
    
}
