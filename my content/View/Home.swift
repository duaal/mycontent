//
//  Home.swift
//  my content
//
//  Created by duaa mohammed on 12/12/2022.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel : taskViewModel=taskViewModel()
    @State var currentDate: Date = Date()
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20){
        // Custom Date Picker....
            CustomeDatePicker(currentDate: $currentDate)
        }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    func HLeading() -> some View {
        self.frame(maxWidth: .infinity ,alignment: .leading)
    }
    func HTrailing() -> some View {
        self.frame(maxWidth: .infinity ,alignment: .trailing)
    }

    func HCenter() -> some View {
        self.frame(maxWidth: .infinity ,alignment: .center)
    }
    func getSafeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }

}
