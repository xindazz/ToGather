#  ToGather App Documentation

## Overview
ToGather is a group travel-planning app meant to facilitate group coordination quickly and asynchronously. While users are unable to directly make reservations through the app, they will be able to make key trip decisions together, reducing their stress. 

## Features

1. Add group members: 
-   members can send a unique code to potential group members by messaging them (SMS)
2. Account creation:
-   users can create an account with email and a password
-   users can sign into an account they created
3. Proposal Voting: 
-  users can vote for a proposal and see if they have voted (and see how many yes/no votes there have been—quantitative input)
-  users can send text responses for a specific proposal (qualitative input)
4. App UI: 
- the app should have consistent colors and styles with the wireframes (edited to use Nunito Sans)
- app should use consistent components, layouts, and spacing throughout
5. Main User Experience: 
-  users can access "published" proposals through the dashboard and view proposals in the proposal view
-  users can interact as a group member or group owner: group members can vote/reply, group owners can do the same and approve proposals ("publishing" them to the main dashboard)
6. Proposal Functionality:
-  create proposals
-  edit proposals
7. Profile/User Functionality:
- can sign in/sign out without exiting the app
- can view profile details (name, email)

### Fixes
- Auto-refresh: changes are automatically pushed to the database
- Button Bug: users can click on the entire button
- Keyboard Bug: keyboard pushes content up half of the screen
- Form UI 
- Database Bug: permissions for authentication

### Considerations (given more time...)
- implemented more streamlined navigation with the dashboard (eliminate the proposal view and abstract all proposal details onto the trip dashboard page)
- staged cards before form submission (creating a trip, creating a proposal, etc. to confirm details with the user), as it was highly desired from user testing
- implemented checklist feature to allow groups to easily coordinate and complete tasks
- document storage/Apple Wallet integration
- Google maps integration for location entry and access

# Sources
** Team Figma **
https://www.figma.com/file/grcIKQQocYBuEZfKwZPzz5/Wireframes?node-id=515%3A24246&t=sHT3i0oNy5Ad9ZTL-1 

** Our Team's Coding Resources ** 
https://docs.google.com/document/d/1MSC3ohwyhoP7UA60HNafGGNbxkWARWxPVxSwAKaybRw/edit?usp=sharing 

## 67-443 Mobile App Design & Development Course Material
** SwiftRepos **

**PriceCheck_Solution **

