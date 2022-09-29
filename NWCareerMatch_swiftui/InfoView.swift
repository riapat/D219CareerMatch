//
//  InfoView.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 4/29/22.
//

import SwiftUI

//class InfoViewModel: ObservableObject {
//
//    @State var firstName: String = ""
//    @State var lastName: String = ""
//    @State var email: String = ""
//    @State var message: String = ""
//
//
//}

struct InfoView: View {
    
    @Environment(\.openURL) var openURL
//    @EnvironmentObject var obj : observed
//    @StateObject var vm = InfoViewModel()
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var message: String = "Please write your message here."
    
    
    
//    init(){
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.init(red: 246 / 255, green: 194 / 255, blue: 172 / 255), .init(red: 178 / 255, green: 221 / 255, blue: 246 / 255)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.all])
            ScrollView {
                VStack{
                    
                    Group {
                        HStack(spacing: -30) {
                            
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("A")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 209 / 255, green: 107 / 255, blue: 63 / 255))

                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("B")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 209 / 255, green: 107 / 255, blue: 63 / 255))

                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("O")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 209 / 255, green: 107 / 255, blue: 63 / 255))

                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("U")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 209 / 255, green: 107 / 255, blue: 63 / 255))

                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("T")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 209 / 255, green: 107 / 255, blue: 63 / 255))

                            }
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(.white)
                                .frame(width: width - 30, height: 175, alignment: .center)
                            Text("D219 Career Match posts job and volunteer opportunities for D219 students provided by local organizations and businesses. The scope of the opportunities is limited to Northern Cook County in Illinois.")
                                .foregroundColor(Color.init(red: 209 / 255, green: 107 / 255, blue: 63 / 255))
                                .font(.title3)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.leading, 35)
                                .padding(.trailing, 35)

                        }
                        .padding(.bottom, 30)
        //                    spacing: -30
                        HStack(spacing: -43) {

                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50)
                                Text("C")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))
                            }

                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50)
                                Text("O")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))

                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("N")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))

                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("T")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))


                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("A")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))


                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("C")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))


                            }
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 100, height: 50, alignment: .center)
                                Text("T")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))


                            }

                        }
                        .padding(.bottom, 5)
                    }
                    
                    
                    
                    Text("Scroll through the form if needed.")
                        .foregroundColor(Color.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                        
                    Group {
                        Section {
                            TextField("First Name", text: $firstName, onEditingChanged: { (isBegin) in
                                if isBegin {
                                    print("Begins editing")
                                } else {
                                    print("Finishes editing")
                                }
                            },
                            onCommit: {
                                print("commit")
                                print(firstName)
                            })
                                .frame(width: width - 30, height: 50, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Last Name", text: $lastName)
                                .frame(width: width - 30, height: 50, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Email", text: $email)
                                .frame(width: width - 30, height: 50, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                        }
                        .disableAutocorrection(true)





                        Section(header: Text("If you have any issues, comments, or questions, please contact us. We will respond as soon as we can.").foregroundColor(Color.black).frame(width: width - 40, height: 80, alignment: .center)) {
                            TextEditor(text: $message)
                                .lineLimit(5)
                                .frame(width: width - 30)
                                .cornerRadius(10)
                                .background(GeometryGetter(rect: $kGuardian.rects[0]))
                                .padding(.top, -15)
//                            MultiTextField(message: $message)
//                                .frame(width: width - 30, height: self.obj.size < 150 ? self.obj.size : 150)
//                                .cornerRadius(10)
//                                .background(GeometryGetter(rect: $kGuardian.rects[0]))
                        }
                        .textCase(nil)
                    }
                    .offset(y: kGuardian.slide)
                    .padding(.bottom)
                    
                    
                    
                    

                    Button(action: {
                        print(firstName)
                        let email = SupportMail(fN: firstName, lN: lastName, msg: message, fromAddress: email, toAddress: "matfah@d219.org", subject: "D219 Career Match - Contact Request")
                        email.send(openURL: openURL)
                    }) {
                        Text("Submit")
                            .font(.title3)
                            .frame(width: 100, height: 50, alignment: .center)
                            .background(Color.init(red: 54 / 255, green: 137 / 255, blue: 185 / 255))
                            .foregroundColor(Color.white)
                            .clipShape(Capsule())
                            .multilineTextAlignment(.center)
                    }
                    .disabled(firstName == "" || lastName == "" || email == "" || message == "Please write your message here.")
                    

                    
                    
                }
            }.onTapGesture {
                hideKeyboard()
            }
            
            
            
            
        }
        
    
    }
    
}

struct InfoView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        InfoView()
//            .environmentObject(observed())
    }
}

//struct MultiTextField: UIViewRepresentable {
//    @EnvironmentObject var obj : observed
//    @Binding var message : String
//
//    func makeCoordinator() -> Coordinator {
//        return MultiTextField.Coordinator(parent1: self)
//    }
//
//
//
//    func makeUIView(context: (UIViewRepresentableContext<MultiTextField>)) -> UITextView {
//        let view = UITextView()
//        view.font = .systemFont(ofSize: 17)
//        view.text = "Please write your message here."
//        view.textColor = UIColor.black.withAlphaComponent(0.35)
//        view.backgroundColor = .white
//        view.delegate = context.coordinator
//
//        self.obj.size = view.contentSize.height
//        view.isEditable = true
//        view.isUserInteractionEnabled = true
//        view.isScrollEnabled = true
//
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiTextField>) {
//
//    }
//
//    class Coordinator : NSObject, UITextViewDelegate {
//        var parent: MultiTextField
//        init(parent1 : MultiTextField) {
//            parent = parent1
//
//        }
//
//        func textViewDidBeginEditing(_ textView: UITextView) {
//            textView.text = ""
//            textView.textColor = .black
//        }
//
//        func textViewDidChange(_ textView: UITextView) {
//            self.parent.obj.size = textView.contentSize.height
//        }
//    }
//}



//class observed  : ObservableObject {
//    @Published var size: CGFloat = 0
//}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }

                return AnyView(Color.clear)
            }
        }
    }
}
