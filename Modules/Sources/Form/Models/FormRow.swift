import UIKit

public protocol FormRowBase {}

public protocol FormRow: FormRowBase {
    associatedtype RowConfiguration: FormRowConfiguration
    
    var image: UIImage? { get set }
    var action: (() -> Void)? { get set }
    var edgeInsets: UIEdgeInsets { get set }
    
    var configuration: RowConfiguration { get set }
}

public class FormRowConfiguration {
    public var backgroundColor: UIColor?
    public var tintColor: UIColor = .systemBlue
    public var accessoryType: UITableViewCell.AccessoryType = .none
    public var selectionStyle: UITableViewCell.SelectionStyle = .default
    public var deselectWhenSelect: Bool = false
    
    public required init() {}
}

public class Row<Configuration: FormRowConfiguration>: FormRow, FormRowModifier {
    public typealias RowConfiguration = Configuration
    public var image: UIImage? = nil
    public var action: (() -> Void)? = nil
    public var edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    
    public var configuration: RowConfiguration = RowConfiguration()
        
    public init(image: UIImage? = nil, action: (() -> Void)? = nil, configurationHandler: ((inout Configuration) -> Void)? = nil) {
        self.image = image
        self.action = action
        configurationHandler?(&configuration)
    }
    
    @discardableResult
    public func padding(top: CGFloat = 12, leading: CGFloat = 16, bottom: CGFloat = 12, trailing: CGFloat = 16) -> Row {
        self.edgeInsets = UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
        return self
    }
}

