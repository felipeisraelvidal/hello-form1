import UIKit

public protocol FormRowBase {}

public protocol FormRow: FormRowBase {
    associatedtype RowConfiguration: FormRowConfiguration
    
    var image: UIImage? { get set }
    
    var configuration: RowConfiguration { get set }
    
    var action: (() -> Void)? { get set }
}

public class FormRowConfiguration {
    public var backgroundColor: UIColor?
    public var tintColor: UIColor = .systemBlue
    public var accessoryType: UITableViewCell.AccessoryType = .none
    public var selectionStyle: UITableViewCell.SelectionStyle = .default
    public var deselectWhenSelect: Bool = false
}
