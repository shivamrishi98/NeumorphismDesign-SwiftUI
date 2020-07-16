//
//  ContentView.swift
//  NeumorphismDesign
//
//  Created by Shivam Rishi on 16/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        ZStack
            {
                Rectangle()
                    .fill(Color("bg"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack
                    {
                        Spacer()
                        
                        Image(uiImage: self.image)
                            .resizable()
                            .frame(width: 300, height: 180)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20)
                        )
                            .shadow(color: Color("lighShadow"), radius: 6, x: -8, y: -8)
                            .shadow(color: Color("darkShadow"), radius: 6, x: 8, y: 8)
                            .frame(width: 300, height: 200)
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            self.isShowPhotoLibrary = true
                        }) {
                            HStack
                                {
                                    Image(systemName: "photo")
                                        .font(.system(size: 20))
                                    Text("Show Photo Library")
                                    
                                    
                            }
                            .foregroundColor(.white)
                            .padding(6)
                            
                            
                        }
                        .background(Color.blue)
                        .cornerRadius(20)
                        
                }.sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
