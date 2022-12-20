//
//  SendDocView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

struct PersonalInfo {
    var names: String?
    var lastname: String?
    var identification: String?
    var email: String?
    var attachType: String?
}
//
//class DocFormViewModel: ObservableObject {
//    @Published var peronalInfo = DocForm()
//    
//    init(peronalInfo: DocForm) {
//        self.peronalInfo = peronalInfo
//    }
//}
//
//struct SendDocView: View {
//    @State var personalInfo = PersonalInfo()
//
//    var body: some View {
//
//        @State var personalInfo = PersonalInfo()
//
//        VStack (spacing: 20){
//
//            Text("Envío de documentación")
//                .font(.callout)
//                .fontWeight(.heavy)
//                .offset(x: -57, y: 0)
//            Button {
//
//            } label: {
//                Image(systemName: "camera")
//                    .resizable()
//                    .frame(width: 60, height: 50)
//                    .tint(.black)
//            }
//
//            IdMenuView()
//
//            IdNumberView(identification: $personalInfo.identification)
//
//            Group {
//                TextField("Nombres",text: $personalInfo.names)
//                    .font(.subheadline)
//                Divider()
//                    .overlay(.black)
//
//                TextField("Apellidos",text: $personalInfo.lastname)
//                    .font(.subheadline)
//                Divider()
//                    .overlay(.black)
//
//                TextField("Email",text: $personalInfo.email)
//                    .font(.subheadline)
//                Divider()
//                    .overlay(.black)
//
//                HStack {
//
//                    Text("Ciudad")
//                    Spacer()
//                    Menu {
//
//                    } label: {
//                        Image(systemName: "arrowtriangle.down.fill")
//                            .tint(.black)
//                    }
//                }
//                .font(.subheadline)
//                Divider()
//                    .overlay(.black)
//                TextField("Tipo de adjunto",text: $personalInfo.attachType)
//                    .font(.subheadline)
//                Divider()
//                    .overlay(.black)
//            }
//
//            Group{
//
//                Button {
//
//                } label: {
//                    HStack{
//                        Image(systemName: "icloud.and.arrow.up")
//                        Text("Documento")
//
//                    }
//                }
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity, maxHeight: 40)
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color("colorPink"))
//                )
//            }
            
//        }.padding(.horizontal, 40.0)
//    }
//}






//struct SendDocView_Previews: PreviewProvider {
//    static var previews: some View {
//        SendDocView(personalInfo: PersonalInfo())
//    }
//}
//
