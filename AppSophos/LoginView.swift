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
            Text("Ingresa tus datos para acceder")
                .fontWeight(.bold)
                .frame(width: 180, height: 35)
                .font(.caption)
                .foregroundColor(Color("loginColor"))
                .multilineTextAlignment(.center)
                
            HStack {
                
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Color("loginColor"))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .overlay(
                        Rectangle()
                            .frame(width: 1,
                                   height: nil,
                                   alignment: .trailing)
                            .foregroundColor(
                                Color("loginColor")
                            ),
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
                        Rectangle()
                            .frame(width: 1,
                                   height: nil,
                                   alignment: .trailing)
                            .foregroundColor(
                                Color("loginColor")
                            ),
                        alignment: .trailing
                    )
                SecureField("Password", text: $password)
                    .foregroundColor(Color("loginColor"))
                Image("Mask")
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
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
                    .frame(width: 280, height: 40)
                    
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
                        .padding(.horizontal)
                    Text("Ingresar con huella")
                        .foregroundColor(Color("loginColor"))
                        .fontWeight(.bold)
                        .font(.footnote)
                        .frame(width: 280, height: 40)
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

struct Rec: Shape {
    

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
       
        return path
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

