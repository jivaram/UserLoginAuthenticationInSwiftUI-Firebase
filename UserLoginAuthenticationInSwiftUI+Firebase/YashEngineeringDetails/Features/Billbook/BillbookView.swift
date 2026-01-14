//
//  BillbookView.swift
//  YashEngineering
//
//  Created by Jiva Ram on 24/05/25.
//

import SwiftUI

struct BillbookView: View {
    @State private var entryDate = Date()
    @State private var dataName = ""
    @State private var quantity = ""
    @State private var unit = "Kg"
    let units = ["Kg", "Pieces"]
    @State private var showCalculator = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Date")) {
                    DatePicker("Select Date", selection: $entryDate, displayedComponents: .date)
                }
                Section(header: Text("Material Name")) {
                    TextField("Enter material name", text: $dataName)
                }
                Section(header: Text("Quantity")) {
                    TextField("Enter quantity", text: $quantity)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Unit")) {
                    Picker("Unit", selection: $unit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Button(action: {
                        // Save logic here
                        print("Date: \(entryDate), Name: \(dataName), Quantity: \(quantity), Unit: \(unit)")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Save Entry")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.white)
                    .listRowBackground(Color.blue)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("primary").ignoresSafeArea())
            .navigationTitle("Daily Material Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCalculator = true
                    }) {
                        Image(systemName: "plus.slash.minus")
                    }
                }
            }
            .sheet(isPresented: $showCalculator) {
                CalculatorView()
            }
        }
       
    }
    
}


struct CalculatorView: View {
    @State private var display = "0"
    @State private var currentInput = ""
    @State private var previousInput = ""
    @State private var operation: String? = nil
    @State private var showAlert = false

    let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", "C", "=", "+"]
    ]

    var body: some View {
        VStack(spacing: 16) {
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 16) {
                    ForEach(row, id: \.self) { button in
                        Button(action: { handleButton(button) }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 60, height: 60)
                                .background(Color.blue.opacity(0.1))
                                .foregroundColor(.blue)
                                .cornerRadius(30)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Input Error"), message: Text("Please enter a valid number"), dismissButton: .default(Text("OK")))
        }
    }

    func handleButton(_ button: String) {
        switch button {
        case "0"..."9":
            if display == "0" || operation == "=" {
                display = button
                operation = nil
            } else {
                display += button
            }
        case "+", "-", "*", "/":
            previousInput = display
            currentInput = ""
            operation = button
            display += button
        case "=":
            calculateResult()
        case "C":
            display = "0"
            currentInput = ""
            previousInput = ""
            operation = nil
        default:
            break
        }
    }

    func calculateResult() {
        let exp = NSExpression(format: display)
        if let value = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            display = value.stringValue
            operation = "="
        } else {
            showAlert = true
        }
    }
}

#Preview {
    BillbookView()
}
