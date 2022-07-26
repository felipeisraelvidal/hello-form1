import UIKit

public protocol FormRowBase {}

public protocol FormRow: FormRowBase {
    var image: UIImage? { get set }
    var action: (() -> Void)? { get set }
    var edgeInsets: UIEdgeInsets { get set }
    var backgroundColor: UIColor? { get set }
    var tintColor: UIColor { get set }
    var accessoryType: UITableViewCell.AccessoryType { get set }
    var selectionStyle: UITableViewCell.SelectionStyle { get set }
    var deselectWhenSelect: Bool { get set }
}

public class Row: FormRow, FormRowModifier {
    
    // MARK: - Properties
    public var image: UIImage? = nil
    public var action: (() -> Void)? = nil
    public var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    public var backgroundColor: UIColor?
    public var tintColor: UIColor = .systemBlue
    public var accessoryType: UITableViewCell.AccessoryType = .none
    public var selectionStyle: UITableViewCell.SelectionStyle = .default
    public var deselectWhenSelect: Bool = false
    
    // MARK: - Initializers
    
    public init(image: UIImage? = nil) {
        self.image = image
    }
    
    // MARK: - Modifiers
    
    @discardableResult
    public func padding(top: CGFloat = 12, leading: CGFloat = 16, bottom: CGFloat = 12, trailing: CGFloat = 16) -> Row {
        self.edgeInsets = UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> Row {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setTintColor(_ color: UIColor) -> Row {
        self.tintColor = color
        return self
    }
    
    @discardableResult
    public func setAccessoryType(_ accessoryType: UITableViewCell.AccessoryType) -> Row {
        self.accessoryType = accessoryType
        return self
    }
    
    @discardableResult
    public func setSelectionStyle(_ selectionStyle: UITableViewCell.SelectionStyle) -> Row {
        self.selectionStyle = selectionStyle
        return self
    }
    
    @discardableResult
    public func setDeselectWhenSelect(_ flag: Bool) -> Row {
        self.deselectWhenSelect = flag
        return self
    }
    
    @discardableResult
    public func addAction(_ action: @escaping () -> Void) -> Row {
        self.action = action
        return self
    }
    
}

