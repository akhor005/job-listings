My thought process:

I originally architected this app with MVVM in mind, starting with the views. Since this app is mostly visual, I first needed to break down the UI into different views (and consequently viewmodels), to ensure efficient state managemnt. For example, each list element needs its own view, so that its visibility state (from filtering) can be controlled independently. View/viewModel development goes was very smooth around this structure.

Theming

Based on experience, centralized theming always makes for a smooth development experience, especially when scaling. Apple likes to separate all of their text formatting attributes, so I consolidate them into a single view modifier (via extension) and store static modifier instances in a theme class. 

Reading the CSV and handling errors

Since Swift does not have any built in CSV readers, I had to make my own, which made for an interesting challenge. My first thought was to use regex, but Swift's string/substring properties can get really messy. Instead, I separated the string naively into an array of strings, then combined elements inside quotations. This approach made unclosed quotations very easy to catch. Other exceptions are improper header, insufficient columns in a given row and file not found. The error is displayed to the user with the row where it occurs, if applicable.

Unfortunately, I did not have time to implement the favorites feature. I'd be happy to discuss my thought process on that next time we meet.
