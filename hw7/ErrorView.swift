//
//  ErrorView.swift
//  newsfeedSkeleton
//
//  Created by Berry Tillage on 4/6/22.
//

import SwiftUI

typealias EmptyStateActionHandler = () -> Void

struct ErrorView: View {
    
    private let handler: EmptyStateActionHandler
    private let error: Error
    
    internal init (
        error: Error,
        handler: @escaping EmptyStateActionHandler) {
            self.error = error
            self.handler = handler
    }
    
    var body:  some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
            Text("Oops...")
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15, weight: .regular))
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Button("Retry") {
                handler()
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
            .font(.system(size: 20, weight: .bold))
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {
            
        }
    }
}

