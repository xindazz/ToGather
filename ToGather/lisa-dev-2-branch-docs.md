#  lisa-dev-2 Branch Documentation

By: Lisa Leung
Created on: November 4, 2022
Last Updated: November 4, 2022

#  Components Folder (ToGather/View/Components/)
## Proposal Card

Base template with yes/no/edit buttons

Includes HStack for alternative button configuations
- Reply (button only)

#  Test MVVM Files 
Everything is kept in the same Models/Views/ViewModels folders as needed until it is deprecated (then placed into the Archive)

## #1 TestDashboard
### Just for an initial connection between the TestDashboardModel, TestDashboardViewModel, and TestDashboardView

no filtering was done in the view model, and all information was all on one view
- our data architecture was ignored in favor of testing the test

### UI Used: Dashboard-deprecated1.Swift
- 

## #2 TestTripDetails
### Just for an initial connection between the TestTripDetailsModel, TestTripDetailsViewModel, TestTripDetailsView, TestTripDetailsRowView

Development from #1 TestDashboard MVVM to start developing the display for trip details ("rows") of data

Test for how overall layout appears based on the progression of data inserted (i.e. only required details entered about a trip detail compared to all of the details)

Model code based off of Master branch code from November 1, 2022 by Xinda Zhou
- Trip.swift
- Event.swift

### UI Used: Dashboard.Swift
- 

# Sources

## 67-443 Mobile App Design & Development Course Material
** SwiftRepos **

**PriceCheck_Solution **

**Hacking with Swift
expanding lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-expanding-lists
selecting items from  lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-allow-row-selection-in-a-list
