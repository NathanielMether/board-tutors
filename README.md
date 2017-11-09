# Board Tutors 

## Problem: 
-	It can be difficult for someone wanting to learn a board sport (e.g. skate boarding, surfing) on their own. Finding the right teacher based on price, quality and location can also be a challenge.

-	For skilled board riders it can be difficult to make money from doing what they are passionate about.

## Solution:
The solution I have created for these problems is a web application that acts as a two-sided marketplace that connects novice (student) and talented (board tutors) board riders together. The app will give users the ability to browse through the board tutor profiles, which give information on their location and how much they charge.

If a student wishes to get a lesson from a board tutor, they will have the ability to book a lesson with them depending on what times are available. If a student wants to know more about a board tutor they will be able to send them a message with any questions. Users also have the ability to review board tutors and give them a rating out of 5, the highest rated board tutors will be more easily found than others.

If a user wants to become a board tutor they can create a profile for themselves, which will be added to the profiles index. Users can create multiple profiles for the different board sports that they would like to teach. Each board tutor profile has links to the other profiles that belongs to that particular board tutor. On each profile, board tutors will be able to select what times they are available to give lessons to students (not yet implanted).

## Design Process and Decisions:

### User Stories and Project Plan - Trello
I began the design of my app by creating a list of user stories, the full list can be found on my trello board - https://trello.com/b/mnuzxwj0/board-tutors

![](assets/images/user-stories.png)

From the user stories I was able to make a rough list of the models that would be required to meet their requirements. 

### Wireframes - Figma
The next step was to create wireframes for the main pages of the app. This fleshed out what attributes the models would have and how the user journey would flow. https://www.figma.com/file/MagRMujaUS2GIC0c9EdgFhJd/Board-Tutors 

![](assets/images/wireframes.png)

### ERD - DBDesigner
After the user stories and wireframes were created I was ready to created a database schema. https://dbdesigner.net/designer/schema/124335

![](assets/images/erd.png)

This is the schema I used for my current design but I realized towards the end of the development of my app that it wasn’t enough fulfill all the requirements of my user stories. 

![](assets/images/erd-update.png)

This is an update I made to the schema to handle setting available times by board tutors and displaying what times are unavailable in the calendar.

### Kanban - Trello

![](assets/images/agile-plan.png)

## Challenges:
-	Setting the start and end time attributes in bookings as Time instead of DateTime
-	Making stripe the amount being charged – may need javascript
-	Setting up Facebook sign up
Favourite parts:
-	Creating search and filtering functionality
-	Validations and user restrictions, surprisingly…

## Setup and configure:
1.	Create, migrate and seed database.
2.	Add keys to .env file
a.	Amazon S3 and IAM
-	S3_ACCESS_KEY_ID
-	S3_SECRET_ACCESS_KEY
-	S3_REGION
-	S3_BUCKET

b. Mailgun
-	MAILGUN_API_KEY
-	MAILGUN_DOMAIN
-	SUPPORT_EMAIL

c. Stripe
-	PUBLISHABLE_KEY
-	SECRET_KEY

d. Facebook developer for omniauth
-	APP_ID
-	APP_SECRET

3.	bundle install
4.	rails s
5.	???
6.	Profit

