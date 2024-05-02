# iOS-Simple-List-App
This App fetches data from an api and computes and stores it and provides internal pagination implementation to fetch data in a list of pages, i.e. loads more data when user scrolls the list.

Architecture Used - VIPER

# Walkthrough of the app

I have followed VIPER architecture and my main view consists of an UITableView. I have an API Service class which fetches the data from API and Interactor is using this class to fetch data. Since the response was a list of 100 posts with title, body, id and user-ID. I have created my own business logic in Interactor to support pagination, so inside my Interactor class there is a computeHeavyLogic function which does nothing but to re structure our array of data such that we get first 10 posts for userID 1-10 and then next 10 posts for all userIDs and so on. Here you will also find a fetchRequestedPage function which is called by View -> Presenter -> Interactor and on each call i provide a list of 10 posts for userID 1-10. So this is how i implemented my pagination logic because the api doesn't support pagination as i checked. On tapping any cell i am displaying its title and Body on a new View Controller presented on the same. For Now, i have not kept any Routing Logic as i didn't feel the requirement for it nut there is flexibilty in code to easily add it. Every time data is requested for new page a loader is displayed and it stops animating when we receive data. 
