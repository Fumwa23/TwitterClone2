//
//  FeedView.swift
//  TwitterClone
//
//  Created by Owen LS on 24/10/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(viewModel.tweets) { tweet in
                        
                        NavigationLink {
                            TweetDetailView(tweet: tweet)
                        } label: {
                            TweetCell(tweet: tweet)
                        }

                        
                    }
                }
            }
            
            Button {                
                isShowingNewTweetView.toggle()
            } label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                print("DEBUG: tweet view dismissed")
            } content: {
                NewTweetsView(isPresented: $isShowingNewTweetView)
            }

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
