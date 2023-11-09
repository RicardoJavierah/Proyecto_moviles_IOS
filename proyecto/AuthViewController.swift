//
//  AuthViewController.swift
//  proyecto
//
//  Created by Ricardo Alvarado Huamani on 8/11/23.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {
    
    
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnIniciarSesion: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        

    @IBAction func btnInicioSesion(_ sender: Any) {
        
        let usuario = usuarioTextField.text
        let password = passwordTextField.text
        
        //Validamos si esta lleno nuestros textField
        if !(usuario!.isEmpty),!(password!.isEmpty){
            
            //Usamos el metodo para crear un usuario y pasamos los parametros
            Auth.auth().signIn(withEmail: usuario!, password: password!) { (result, error) in
                if result == result, error == nil {
                    
                    //creamos las alertar
                    let alertController = UIAlertController(title: "Validado", message: "Se inicio Correctamente", preferredStyle:.alert)
                    
                    let inicioAction = UIAlertAction(title: "OK", style: .default) { action in
                        
                    }
                    
                    alertController.addAction(inicioAction)
                    self.present(alertController, animated: true, completion: nil)
                    print("inicio sesion")
                    
                }else{
                    let alertController = UIAlertController(title: "Invalidado", message: "Credenciales Invalidas", preferredStyle:.alert)
                    
                    let noInicioAction = UIAlertAction(title: "OK", style: .default) { action in
                        
                    }
                    
                    alertController.addAction(noInicioAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }

        }else {
            let alertController = UIAlertController(title: "Denegado", message: "Ingresa sus datos Correctamente", preferredStyle:.alert)
            
            let cancelAction = UIAlertAction(title: "Intentar", style: .cancel) { action in
                self.usuarioTextField.text = ""
                self.passwordTextField.text = ""
            }
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            print("Error al ingresar")
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
