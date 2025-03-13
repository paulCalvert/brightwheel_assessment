# brightwheel_assessment
Project to consolidate multiple lead sources into one data model (for assessment)

# Project Goal
Take the four different lead sources from the Google doc and merge them into a clean data source to answer business questions

# Process Steps
1) Come up with a plan of attack
2) Investigate raw data
3) Stage the 4 data sources into DBT
4) Map the 4 data sources into one consolidated table
5) Clean up the consolidated table
6) Write tests for the consolidated table
7) Create data model based on the cleaned up, consolidated table
8) Hypthosize what questions or insights could be answered with the data model

# Self-Reflection
This project was really fun, but BOY DID THE TIME FLY. I felt like I was trucking along really well, and suddently realized the time was gone. While I wish I had more time to show off my coding prowess, I still think I spent my time well. More detailed out in the Trade-Offs section

# Trade-Offs
## Things I prioritized
**Process Steps 1, 2, 4**
For this assessment I prioritized planning, organizing, and investigation. I used JIRA to capture the requirements of the assignment, and used it to capture my progress as I worked. I also spent more time investigating the raw data to better understand what I was working with, the limitations of the source information, and how to begin planning around those limitations.
### PROS
* Felt much more clear in purpose in my work. Spent very little time idling or wondering what to do next
* If I can give the stakeholders access, will give them direct insight into my process and documentation style (invited Jonathan, need Megan's email address to invite her, or whoever else reviewing this (email me at paulcalvertdesigns@gmail.com so I can invite you!)
* Investigating the raw data helped a lot of later steps go MUCH quicker (especially step 4), and gave me a much more insight into how the destination table should look like
### CONS
* Spent more time investigating data than I would have liked. If I could have done it again, I would probably have not documented so much on the table structures. Maybe just peruse the tables and quickly cherry-pick the columns I wanted to keep?

## Lower Priority Items
**Process Steps 5 & 6**
I got a chance to work on these items, but did not get a chance to spend as much time on them as I would have liked. That is part of the design of the project though, and I know what I would have liked to have done if given more time.
### PROS
* Since I spent time on organizing, investigating, and mapping out the data, the items I created came together VERY quickly
* Have a clear idea on next steps I would do to clean and test the data (verify phone number lengths, other duplicate checking, etc)
## CONS
* Did not get a chance to do the additional cleanup and testing that I wanted to do
* Did not get a chance to showcare my technical ability with complex SQL logic

## Things I de-prioritized
**Process Steps 3, 7, 8**
I decided to not go through the steps of the Staging process. It seemed to me it would take a longer time trying to simulate how I would have imported each data source into the data environment, with trying to handle all of the different named columns appropriately with data types and NULLs. If I were to try and do this in the future I would write a Python script to go to this Google document and copy each of the contents of the tabs into their own temporary SQL tables. The only real thing that bummed me out is that I wanted to get to the final Data Model and qustions, but just ran out of time.
### PROS
* I had more time to work on other aspects of the project
### CONS
* I did not get a chance to showcase my skills in this part of the project
* I did not get a chance to work on the final data model, and the types of business questions we could answer with it

# Ideas for Longer Term ETL strategies/processes
I had a few ideas on how to better support this process going forward.
* **Standarize Source Tables**: A lot of this project was spent investigating the disparate data sources and catloging their differences. This is okay enough for only four data sources, but it is not scalable to do this if you want to expand. There should be a template structure replicated for any additional data sources going forward to minimize time spent on recifying the data afterwards
* **Require and populate all fields used in final cleaned up table**: This is a little related to the above point, but just wanted to emphasize this point. There were a lot of columns that looked important but only present in 3/4 of the data sources. I think it will make the final data model suffer if someone (for example) wants to do a search on emails, and automatically 1/4 of the data is not available
*  **Standardize key fields**: Status and License Type look important and are present in 3/4 of the data sources. But I did not get a chance to confirm that they are all using the same labels, and that seems like it should be handled at the source level
*  **Snapshotting/History**: The first data tab had _some_ history with the date columns, but even those are not good enough I think. I would implement an event tracking table for the "last viewed at" dates, and a snapshot or an SCD Type 2 table to track changes to the companies you are doing business with

# How you explored the data
I spent a lot of time on this step. Basically I started at the first tab, and looked through the columns to see what was populated and with what data types. Then I wrote them all down in JIRA, along with notes and observations. 
Then I copied those columns into a new comment in JIRA, and updated them with colors and strikethroughs for what I could find on the second tab. Then I repeated the process for the 3rd and 4th tabs.

While this prevented me from getting to the code faster, it provided me with a much better understanding of the data I was working with and helped me adjust my plans further down the line. It helped me map the four data sources together pretty quickly, and I knew what type of data cleanup and testing I wanted to do later.

# Testing, QA, data validation
While I did not go through the process of importing the data into SQL Server and write actual code, since I did the investigation on the data I had a very good idea of how I would test and QA the data. While my example test code was pretty simple and to the point, I know what I would to further develop my testing plans.

## Testing & QA Plans
* I would create an error logs table to populate with the results of the duplicate_phone test sql I created
* I _might_ set up an automated message to email or text me with failures. If this was a regular or non-critical error, I would not send the message
* Other things I would test for include: other duplicate fields (email, company name, etc), incomplete addresses, columns with NULL values

## Data Validation
* I would create a Python script to load these Google sheet tabs into four seperate temp tables, and then consolidate them into one table similar to how I mapped out the data in this project
* Once that was done I would do some comparisons between my new, cleaned up table against this new Python table based on the Phone key
* Then I would write some comparison statements to make sure my data is still matching what I pulled from, minus the cleaned up edits I made
* If there was a LOT of data, I would aggregate up the matches and mismatches to make sure that I had a low variance between the two of them

For all of this I would document in JIRA, Confluence, GIT, or whatever tool you use. I like to use notebooks for my testing, so that I can write code blocks explaining my steps and reasoning for my process. Also if the notebooks are saved to a publically shared location, then other people can run my tests too to confirm my results!

# Anything else you wish to include
If I had more time, I would have loved to have fleshed out my data clean up and testing. Also I would have loved a chance to take a crack at the data model and begin hypthosizing which business questions and insights we could have gotten out of it.
I feel like if I could have cut out a little of my time documenting or data investigating, I might have had a chance to do a little more. But I also recognize that since I took that extra time planning I had a very strong understanding on the problem and confident I could outline a clear roadmap of how to complete the rest of the project. That being said, this is my proposed timeline to complete this project (if given the chance)

* **Overall Time needed** - 70 minutes
* **5) Clean up the consolidated table** - 15 minutes
* **6) Write tests for the consolidated table** - 15 minutes
* **7) Create data model based on the cleaned up, consolidated table** - 15 minutes
* **8) Hypthosize what questions or insights could be answered with the data model** - 10 minutes
* **3) Stage the 4 data sources into DBT** - 15 minutes

I have outlined the types of things I would do on these steps if given the chance, and I think I would need this much time to do each and every one. For the data model(s) and questions I could see a lot of that time being spent strategizing and less executing, since my Silver data cleanup table is placed to quickly be transformed into a Golden metrics table.
