//
//  SwiftUIView.swift
//  ADCIOSVisualizer
//
//  Created by Hugo Gonzalez on 9/15/23.
//  Copyright © 2023 Microsoft. All rights reserved.
//

import SwiftUI

@objc(ADCIOSSwift)
@objcMembers public class SwiftUIBridge: NSObject {
    func getHostViewController(subview: UIView) -> UIViewController {
        let view = SwiftUIView()
        let vc = UIHostingController(rootView: view)
        return vc
    }
}

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
