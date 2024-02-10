//
//  NewTweetsView.swift
//  TwitterClone
//
//  Created by Owen LS on 18/11/21.
//

import SwiftUI
import Kingfisher

struct NewTweetsView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel : UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .top){
                    
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    TextArea("What's Happening", text: $captionText)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(
                    leading: Button(
                        action: {
                            isPresented.toggle()
                        },
                        label: {
                            Text("Cancel")
                                .foregroundColor(Color("twitterBlue"))
                        }),
                    trailing: Button(
                        action: {
                            viewModel.uploadTweer(caption: captionText)
/// BELOW IS THE METHOD USING A COMPLETION HANDLER
//                            viewModel.uploadTweer(caption: captionText) { _ in
//                                self.isPresented.toggle()
//                            }
                        },
                        label: {
                            Text("Tweet")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color("twitterBlue"))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            
                    }))
                Spacer()
            }
        }
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView(isPresented: .constant(true))
    }
}
