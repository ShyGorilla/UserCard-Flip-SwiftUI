//
//  ContentView.swift
//  UserCard
//
//  Created by Marwan on 07/08/2021.
//

import SwiftUI

struct MainView: View {
    
    @State var Flip = false
    
    var body: some View {
        VStack{
            VStack{
                Color.blue
            }
            .cornerRadius(10)
            .frame(height: 465)
            .shadow(color: .blue, radius: 7)
            .rotation3DEffect(self.Flip ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .onTapGesture {
                withAnimation(.easeInOut){
                    Flip.toggle()
                }
            }
            .overlay(
                FlipCardView(Flip: $Flip)
                    .animation(.easeIn.delay(0.15))
            , alignment: .center)
        }
        .padding()
    }
}

struct FlipCardView: View{
    
    @Binding var Flip: Bool
    
    var body: some View{
        if Flip{
            BackCardView()
                .padding()
        }else{
            FrontCardView()
                .padding()
        }
    }
}

struct FrontCardView: View{
    
    var body: some View{
        VStack{
            HStack{
                Image("swift")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                Spacer()
                VStack{
                    Text("App Name")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
            Text("User Identity Card")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Divider()
            Image(systemName: "person")
                .resizable()
                .padding(10)
                .frame(width: 70, height: 70, alignment: .center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
            VStack(alignment: .leading){
                HStack{
                    Text("Name")
                    Spacer()
                    Text("ShyGorilla")
                    //Spacer()
                }
                Divider()
                HStack{
                    Text("User ID")
                    Spacer()
                    Text("1234")
                    //Spacer()
                }
                Divider()
                HStack{
                    Text("Any")
                    Spacer()
                    Text("Any")
                    //Spacer()
                }
                Divider()
                HStack{
                    Text("Blood Group")
                    Spacer()
                    Text("")
                    //Spacer()
                }
                
            }
            .padding()
            .background(Color.gray.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.headline)
            Spacer()
        }
    }
}

struct BackCardView: View{
    
    var body: some View{
        VStack{
            HStack{
                Image("swift")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                Spacer()
                VStack{
                    Text("App Name")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
            Text("User Identity Card")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Divider()
            VStack(alignment: .center){
                Spacer().frame(height: 20)
                Text("This card is the property of This Company. If found, please return to:")
                    .multilineTextAlignment(.center)
                Text("P.O Box 12345. Dubai")
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
            .font(.headline)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
