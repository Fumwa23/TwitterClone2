//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Owen LS on 24/11/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var fullName: String = ""
    @State var username: String = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
            ZStack {
                VStack {
                    Button {
                        showImagePicker = true
                    } label: {
                        ZStack {
                            if let image = image{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(70)
                                    .padding(.top, 88)
                                    .padding(.bottom, 16)
                            }else{
                                Image("plus_photo")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .padding(.top, 88)
                                    .padding(.bottom, 16)
                                .foregroundColor(.white)
                            }
                        }
                    }
                    .sheet(isPresented: $showImagePicker) {
                        loadImage()
                    } content: {
                        ImagePicker(image: $selectedUIImage)
                    }

                    
                    VStack (spacing: 20){
                        CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 32)
                    
                    //SIGN UP BUTTON
                    
                    Button {
                        
                        guard let image = selectedUIImage else {return}
                        
                        viewModel.registerUser(email: email, password: password, username: username, fullname: fullName, profileImage: image)
                        
                    } label: {
                        
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 315, height: 50)
                            .background(Color(.white))
                            .clipShape(Capsule())
                            .padding()
                        
                    }
                    Spacer()
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        HStack(){
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }

                    
                    
                }
            }
            .background(Color(red: 30 / 255, green: 161 / 255, blue: 243 / 255))
            .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
