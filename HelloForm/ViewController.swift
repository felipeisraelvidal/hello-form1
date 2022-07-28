import UIKit
import Form
import CoreUI

class ViewController: FormViewController {
    
    private var text = Observable("")
    private var isPrivate = Observable(false)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Form"
        
        view.backgroundColor = .systemBackground
        
        let shouldShowExperimental = true
        
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let arr = [
            "Item 1",
            "Item 2",
            "Item 3"
        ]
        
        makeSections {
            FormSection {
                CustomRow {
                    HStack(alignment: .center, distribution: .fillEqually, spacing: 16) {
                        UIView()
                            .setBackgroundColor(.systemBlue)
                            .setHeight(50)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            UILabel("Hello, World!")
                            
                            UILabel("Hello, World! 2")
                                .setTextColor(.white)
                        }
                        .setBackgroundColor(.systemPurple)
                    }
                    .setBackgroundColor(.systemRed)
                    .fillSuperview(offset: 0)
                    .setHeight(80)
                }
            }
            
            FormSection(footer: "Enter your text and tap enter to add new item") {
                SwitchRow("Is private", isOn: isPrivate)
                    .selectionStyle(.none)
                
                TextFieldRow("Placeholder", text: self.text)
                    .font(.preferredFont(forTextStyle: .title2))
                    .onSubmit { [weak self] _ in
                        self?.addRow()
                    }
                    .autocapitalizationType(.sentences)
                    .clearButtonMode(.whileEditing)
                    .returnKeyType(.done)
                    .selectionStyle(.none)
                    .padding(top: 16, bottom: 16)
                
                TextRow("Add Item")
                    .textColor(.systemBlue)
                    .deselectWhenSelect(true)
                    .addAction { [weak self] in
                        self?.addRow()
                    }
            }
            
            FormSection("section_1") {
                for item in arr {
                    TextRow(item)
                        .accessoryType(.detailDisclosureButton)
                        .addDetailDisclosureButtonAction {
                            print("Teste")
                        }
                }
            }

            if shouldShowExperimental {
                FormSection(title: "Section 1", footer: "Lorem Ipsum") {
                    TextRow(text, image: .init(systemName: "iphone"))
                        .textColor(.systemRed)
                        .accessoryType(.disclosureIndicator)
                        .deselectWhenSelect(true)
                    
                    TextRow("Row 1")
                        .selectionStyle(.none)
                    
                    TextRow("Row 2")
                }
            }

            FormSection(footer: text) {
                TextDescriptionRow(title: "Title", description: text)
                    .textColor(
                        titleLabel: .systemPurple,
                        descriptionLabel: .systemBrown
                    )
                
                TextDescriptionRow(.subtitle, title: "Title", description: text)
            }
            
            FormSection {
                let swiftSymbol = UIImage.init(systemName: "swift")
                
                TextRow("Add New Section", image: swiftSymbol)
                    .textColor(.systemBlue)
                    .deselectWhenSelect(true)
                    .addAction { [weak self] in
                        self?.addSection()
                    }
            }
        }
    }
    
    func addSection() {
        let newSection = FormSection {
            TextRow("Testing...")
        }
        insertSection(newSection, at: 1)
    }
    
    func addRow() {
        if text.value != "" {
            let newTextRow = TextRow("\(isPrivate.value ? "[L] " : "")\(text.value)")
                .accessoryType(.detailDisclosureButton)
            
            insertRow(newTextRow, atSection: "section_1", at: 0)
            
            self.text.value = ""
        }
    }

}

#if DEBUG
import SwiftUI
struct ViewControllerPreviews: PreviewProvider {
    
    static var previews: some View {
        ContainerPreview()
            .ignoresSafeArea()
    }
    
    struct ContainerPreview: UIViewControllerRepresentable {
        typealias UIViewControllerType = UINavigationController
        
        func makeUIViewController(context: Context) -> UIViewControllerType {
            let viewController = ViewController()
            
            let navigationController = UINavigationController(rootViewController: viewController)
            
            return navigationController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
    
}
#endif
