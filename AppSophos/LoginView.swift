//
//  LoginView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 13/12/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Image("sophosLogin")
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            Text("Ingresa tus datos para acceder")
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundColor(Color("loginColor"))
                .multilineTextAlignment(.center)
                
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Color("loginColor"))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .overlay(
                        Divider()
                            .frame(width: 1.0)
                            .background(Color("loginColor")),
                        alignment: .trailing
                    )
                TextField("Email", text: $email)
                    .foregroundColor(Color("loginColor"))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("loginColor"), lineWidth: 1)
            )
            .padding(.vertical, 20)
            
            HStack {
                Image("keyIcon")
                    .overlay(
                        Divider()
                            .frame(width: 1.0)
                            .background(Color("loginColor")),
                        alignment: .trailing
                    )
                SecureField("Password", text: $password)
                    .foregroundColor(Color("loginColor"))
                Button {
                    
                    
                } label: {
                    Image("Mask")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("loginColor"), lineWidth: 1)
            )
            
            Button {
                
                
            } label: {
                Text("Ingresar")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.footnote)
                    .frame(width: 338.0, height: 40)
                    .padding(.horizontal, 15)
                    
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("loginColor"))
                )
            .padding(.top, 39)
            
            Button {
                
                
            } label: {
                HStack {
                    Image("fingerprint")
                        .padding(.leading)
                    Text("Ingresar con huella")
                        .foregroundColor(Color("loginColor"))
                        .fontWeight(.bold)
                        .font(.footnote)
                        .frame(width: 310, height: 40)
                        .padding(.trailing, 15)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color("loginColor"))
                )
            .padding(.top, 19)
        }
        .padding(.horizontal, 15)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

