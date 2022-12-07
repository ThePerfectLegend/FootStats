# FootStats
The Project uses MVVM architecture, interface created with SwiftUI, network requests with async/await using API from https://github.com/azharimm/football-standings-api


![GitHubDemoFootStats](https://user-images.githubusercontent.com/94032706/184534229-3aca6ea1-2b68-41e5-a9f2-6bc65ed46d60.png)
![GitHubDemoFootStats3](https://user-images.githubusercontent.com/94032706/184534410-d45402a6-0ceb-48e0-a6af-d16a7058fb8f.png)
![GitHubDemoFootStats2](https://user-images.githubusercontent.com/94032706/184534237-1e296634-4625-44d6-aad6-a51f5585dd17.png)

## Requirement

On the first screen, list the available leagues using the appropriate method from the repository. League names, logo, abbreviation should be displayed. If necessary, the name should move to another line, not cut off, the logos should all be the same size..

When you select a specific league (by clicking on it from the list), a second screen should open, where all available seasons of the selected league are displayed using the appropriate method. Seasons should also be displayed in the form of a table, in which all the necessary information about each season should be located as much as possible (start date, end date, season name, and so on, everything that is useful is in the API).

When you click on a specific season, a third screen opens. In it, we display the league table for a given season. We display either all the useful information available in the API, including whether the team goes to the Champions League, logo, goal difference, average number of points, etc. (here you can use screen rotation to expand the table when you turn the phone), or display only part of the information, which you think is the most important.

Also on the screen there should be the ability to change the season using a drop-down menu / picker or any other tool that you think will come in here.

It should also be possible to navigate back between screens using the navigation bar.

## Technologies & Functionality 
- Project uses MVVM Architecture with interface created with `SwiftUI`
- Network requests with `async/await`, async image loading
- Caches downloaded images
