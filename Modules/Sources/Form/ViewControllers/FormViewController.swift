import UIKit

open class FormViewController: UIViewController {
    
    // MARK: - Proprties
    
    private(set) var sections: [FormSection] = []
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }
    
    open override func loadView() {
        super.loadView()
        
        setupConstraints()
    }
    
    // MARK: - Private methods
    
    private func setupConstraints() {
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    private func registerCells() {
        
        tableView.register(TextRowTableViewCell.self, forCellReuseIdentifier: TextRowTableViewCell.identifier)
        tableView.register(TextDescriptionRowTableViewCell.self, forCellReuseIdentifier: TextDescriptionRowTableViewCell.identifier)
        tableView.register(CustomRowTableViewCell.self, forCellReuseIdentifier: CustomRowTableViewCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    // MARK: - Public methods
    
    public func makeSections(@FormBuilder _ content: () -> [FormSection]) {
        self.sections = content()
    }
    
}

extension FormViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        
        switch row.self {
        case let formRow where formRow is TextRow:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextRowTableViewCell.identifier, for: indexPath) as? TextRowTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: formRow as! TextRow)
            
            return cell
        case let formRow where formRow is TextDescriptionRow:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextDescriptionRowTableViewCell.identifier, for: indexPath) as? TextDescriptionRowTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: formRow as! TextDescriptionRow)
            
            return cell
        case let formRow where formRow is CustomRow:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomRowTableViewCell.identifier, for: indexPath) as? CustomRowTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: formRow as! CustomRow)
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            cell.textLabel?.text = "Row \(indexPath.row)"
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        if let row = row as? (any FormRow) {
            if row.configuration.deselectWhenSelect {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
}