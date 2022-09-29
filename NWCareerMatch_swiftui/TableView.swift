//
//  TableView.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/13/21.
//

import SwiftUI

struct TableView: View {
    @State private var showingFilter = false
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var showPartTime = "Part-TimeFull-Time"
    @State private var jobYear = "Year-RoundSeasonal"
    @State private var jobType = "Paid Hourly EmployeePaid InternshipUnpaid InternshipPaid ApprenticeshipUnpaid Apprenticeship"
    @State private var job_minage = 19.0
    @State private var job_daysWeek = 0.0
    @State private var job_hoursDay = 0.0
    @State private var job_hourlyPay = 1.0

    var filteredCareers: [Career] {
        modelData.careers.filter { career in
            (!showFavoritesOnly || career.isFavorite) &&
            showPartTime.contains(career.job_time) &&
            jobYear.contains(career.job_year) &&
            jobType.contains(career.type) &&
            Int(job_minage) >= career.min_age &&
            Int(job_daysWeek) <= career.work_days &&
            Int(job_hoursDay) <= career.work_hours &&
            Int(job_hourlyPay) <= career.hourly_pay
            
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCareers) { career in
                    
                    NavigationLink(
                        destination:
                            JobDetail(idC: career.id)) {
                                TableViewCell(idC: career.id)
                            }
                            .padding(.trailing, -32)
                    
                        
                            

                    
                }
            }.listStyle(.plain)
                .listRowInsets(.init())
                
            
            .navigationTitle("Job Postings")
            
            .toolbar {
                Button(action: {showingFilter.toggle()
                    
                }) {
                    Text("Filter")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                }
            }
            .sheet(isPresented: $showingFilter) {
                Filter(showFavoritesOnly: $showFavoritesOnly, showPartTime: $showPartTime, jobYear: $jobYear, carType: $jobType, minAge: $job_minage, daysPerWeek: $job_daysWeek, hoursDay: $job_hoursDay, hourPay: $job_hourlyPay)
            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
            .environmentObject(ModelData())
        
    }
}
