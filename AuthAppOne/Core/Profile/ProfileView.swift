//
//  ProfileView.swift
//  AuthAppOne
//
//  Created by Ahmed Halilovic on 20. 11. 2023..
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isProfileDescriptioniewPressed = false
    @State private var isAboutTheAppPressed = false

    var body: some View {
        if let user = viewModel.currentUser {
            
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Button {
                        isProfileDescriptioniewPressed = true
                    } label: {
                        SettingsRowView(imageName: "person.circle.fill", title: "Profile description", tintColor: Color(.orange))
                    }
                    
                    Button {
                        isAboutTheAppPressed = true
                    } label: {
                        SettingsRowView(imageName: "person", title: "About the app", tintColor: Color(.green))
                    }

                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.red))
                    }
                    
                    Button {
                        print("Delete account...")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: Color(.red))
                    }
                }
            }
            
            //Using navigationView to enable navigation
            .navigationTitle("Profile description")
            .sheet(isPresented: $isProfileDescriptioniewPressed) {
                ProfileDescriptionView()
            }
            .sheet(isPresented: $isAboutTheAppPressed) {
                AboutTheAppView()
            }
            
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
