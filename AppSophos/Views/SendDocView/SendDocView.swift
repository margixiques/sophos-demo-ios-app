//
//  SendDocView.swift
//  AppSophos
//
//  Created by Margarita Xiques on 19/12/22.
//

import SwiftUI

//struct PersonalInfo {
//    var names: String?
//    var lastname: String?
//    var identification: String?
//    var email: String?
//    var attachType: String?
//}

//class DocFormViewModel: ObservableObject {
//    @Published var personalInfo: PersonalInfo
//
//    init(personalInfo: PersonalInfo) {
//        self.personalInfo = personalInfo
//    }
//}

struct SendDocView: View {
    
   @State var identification: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack (spacing: 20){
                
                Text("Envío de documentación")
                    .font(.callout)
                    .fontWeight(.heavy)
                    .offset(x: -57, y: 0)
                Button {
                    
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 60, height: 50)
                        .tint(.black)
                }
                
                IdMenuView()
                
                IdNumberView(identification: "")
                
                VStack (spacing: 20){
                    
                    ForEach(FieldType.allCases, id: \.rawValue) { TextFieldView(personalInfo: "", fieldType: $0)}
                }
                
                HStack {
                    
                    Text("Ciudad")
                    Spacer()
                    Menu {
                        
                    } label: {
                        Image(systemName: "arrowtriangle.down.fill")
                            .tint(.black)
                    }
                }
                .font(.subheadline)
                Divider()
                    .frame(height: 1)
                    .overlay(.black)
                    
                TextField("Tipo de adjunto",
                          text:$identification)
                    .font(.subheadline)
                Divider()
                    .frame(height: 1)
                    .overlay(.black)
                
                SendButtonsView()
                
                
            }
            .padding(.horizontal, 40.0)
        }
    }
}



struct SendDocView_Previews: PreviewProvider {
    static var previews: some View {
        SendDocView()
    }
}

