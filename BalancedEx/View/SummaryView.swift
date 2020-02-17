//
//  SummaryView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var summary = SummaryViewModel()
    var body: some View {
        Text("$ \(self.summary.totalExpenses)")

    }
}

