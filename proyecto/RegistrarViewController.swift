//
//  RegistrarViewController.swift
//  proyecto
//
//  Created by Ricardo Alvarado Huamani on 9/11/23.
//

import UIKit
import FirebaseAuth

class RegistrarViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        
        //guardamos nuestro contenidos de los textField
        let nombre = nombreTextField.text
        let apellido = apellidoTextField.text
        let correo = correoTextField.text
        let password = passwordTextField.text
        
        //Validamos si esta lleno nuestros textField
        if !(nombre!.isEmpty),!(apellido!.isEmpty),!(correo!.isEmpty),!(password!.isEmpty){
            
            //Usamos el metodo para crear un usuario y pasamos los parametros
            Auth.auth().createUser(withEmail: correo!, password: password!) { (result, error) in
                if result == result, error == nil {
                    
                    //creamos las alertar
                    let alertController = UIAlertController(title: "Enviado", message: "Se registro correctamente", preferredStyle:.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default) { action in
                        self.nombreTextField.text = ""
                        self.apellidoTextField.text = ""
                        self.correoTextField.text = ""
                        self.passwordTextField.text = ""
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                    print("registro correcto")
                }
            }

        }else {
            let alertController = UIAlertController(title: "Oops", message: "Ingresa tus datos Correctamente", preferredStyle:.alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { action in
                
            }
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            print("falta llenar Datos")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
