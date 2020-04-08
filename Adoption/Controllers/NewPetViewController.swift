import UIKit

protocol AddNewPetProtocol : class {
    
    func addNew(pets:Pet)
}

class NewPetViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    @IBOutlet weak var ownerLbl: UITextField!
    @IBOutlet weak var petLbl: UITextField!
    @IBOutlet weak var typeLbl: UITextField!

    @IBOutlet weak var phoneLbl: UITextField!
    
    var selectedType: String?
    var typeList = ["dog","cat"]
    
    var pets: Pet?
    weak var delegate: AddNewPetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewNavigationButton()
        createPickerView()

    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return typeList.count // number of dropdown items
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return typeList[row] // dropdown item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedType = typeList[row] // selected item
        typeLbl.text = selectedType
    }
    
    func createPickerView() {
           let pickerView = UIPickerView()
           pickerView.delegate = self
           typeLbl.inputView = pickerView
    }
    
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
       typeLbl.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
    
    func addNewNavigationButton(){
        let addNavButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addNewsAction(sender:)))
        navigationItem.rightBarButtonItem = addNavButton
        
    }
    @objc func addNewsAction(sender: UIBarButtonItem){
        if ownerLbl.text == "" || petLbl.text == "" || phoneLbl.text == "" || typeLbl.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        } else {
            let newPet = Pet(mote: petLbl.text!, ownerName: ownerLbl.text!, phoneNumber: phoneLbl.text!, animalType: typeLbl.text!)
            delegate?.addNew(pets: newPet)
            
            
        }
        
        
    }
        
}
    
    
    
    
    

    



