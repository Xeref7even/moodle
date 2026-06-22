## Moodle — Flutter Coursework

### Overview

Your task is to recreate a mobile-optimised version of the Moodle platform using Flutter. You must not start from scratch, as you need to begin by forking the GitHub repository that contains the incomplete template code. [The getting started section of this document](#getting-started) will explain more. Once you have completed the application, you will submit the link to your forked repository on Moodle for assessment and demonstrate your application on an online meeting, which you need to book using [this link](https://outlook.office.com/bookwithme/user/e0acc34f2ca040b295fb20cfce7425a2@port.ac.uk/meetingtype/qZuY5y_IuUimqFEq4d1oDA2?anonymous&ismsaljsauthenabled&ep=mlink). See the submission and demonstration sections for more information.

### Getting Started

#### Prerequisites:

***You must already have a GitHub account to be able to start this coursework. If you have not done so, read and complete the exercises in [worksheet 0](https://manighahrmani.github.io/sandwich_shop/worksheet-0.html) before continuing.***

***You also need to be able to edit and run a Flutter project in your environment of choice. You must also be able to commit your changes to GitHub. Both of these are explained in [worksheet 1](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html); complete it before continuing if you have not done so already.***

⚠️ If you do not own a high-spec computer, you can either use the university's machines (see the “Remote access to University computers” section of [the Study Anywhere document linked here](https://myport.port.ac.uk/it-support/student-it-support/study-anywhere)) or use [Firebase Studio](https://firebase.studio/). More details are in [worksheet 1](https://manighahrmani.github.io/sandwich_shop/worksheet-1.html).

#### Fork and Clone the Repository:

##### Step 1: Fork the Repository

Click the Fork button in the top right corner of [this page](https://github.com/manighahrmani/moodle/) to create your public copy of the repository. Or just head directly to this link: [https://github.com/manighahrmani/moodle/fork](https://github.com/manighahrmani/moodle/fork)

![Step 1.1: Forking the Repository](images/step1_fork.png)

Do not change anything on the Create fork page. You should then get a public fork of my repository with a URL like this (where YOUR-USERNAME is replaced with your actual GitHub username): [https://github.com/YOUR-USERNAME/moodle](https://github.com/YOUR-USERNAME/moodle)

![Step 1.2: Forking the Repository](images/step1_fork_page.png)

##### Step 2: Clone and Open in VS Code

Open VS Code and click the Clone Repository button in the Source Control panel on the left side of the screen. Open your editor and clone this repository from the source control panel on the left. Alternatively, open the command palette with Ctrl+Shift+P or Cmd+Shift+P and enter “Git: Clone”.

![Step 2.1: Opening in VS Code](images/step2_vscode.png)

Paste the URL of your forked repository and press enter. You will then be prompted to select Open in This Window to open the cloned repository in VS Code.

![Step 2.2: Selecting the Repository](images/step2_repos.png)

If asked to install the Flutter extension and run flutter pub get in the pop-ups, go ahead and install and run them.

![Step 2.3: Installing Flutter Extension and Running pub get](images/step2_install.png)

If you do not get these pop-ups, go to the extensions tab on the left side of the screen and install the Flutter extension manually. Then, open the terminal and run flutter pub get. See the screenshot below for reference.

![Step 2.4: Installing Flutter Extension and Running pub get](images/step2_install_alternative.png)

##### Step 3: Complete First Setup Task

***Open the lib/widgets/nav_drawer.dart file.***

***Replace "Yourname Here" with your actual name.***

***Replace "up1234567" with your actual UP identification number.***

***Save the file and commit your change as shown below:***

![Step 3: Complete First Setup Task](images/step3_commit.png)

##### Step 4: Run the Application

```bash
flutter pub get
flutter run -d chrome
```

Alternatively, click on the run button in the `main.dart` as shown below and make sure the device is set to Chrome:

![Step 4: Run the Application](images/step4_terminal.png)

The application will build and open in a new Chrome browser window, displaying the Dashboard.

##### Step 5: Emulate Mobile Layout in DevTools

To view the responsive layout and test your application:

***Press F12 (or right-click anywhere and select Inspect) in Chrome to open Developer Tools.***

***Click the Toggle Device Toolbar icon (or press Ctrl+Shift+M / Cmd+Shift+M) to emulate a mobile screen.***

***From the left-hand side dropdown, select an iPhone (e.g., iPhone 12 Pro) to emulate a mobile layout. See the screenshot below for reference.***

![Step 5: Emulate Mobile Layout in DevTools](images/step5_devtools_open.png)

Remember your application must be designed for mobile devices first (we may not even run your submission on desktop layout during the demo).

---

## Marking Criteria

This assessment is worth 100% of the mark for item 1. The mark for the assessment is divided into two components:

***Application (functionality) (30%): Demonstrated through a live online demo booked using [this link](https://outlook.office.com/bookwithme/user/e0acc34f2ca040b295fb20cfce7425a2@port.ac.uk/meetingtype/qZuY5y_IuUimqFEq4d1oDA2?anonymous&ismsaljsauthenabled&ep=mlink)***

***Software Development Practices (25%): Assessed through your repository***

⚠️ You will only receive marks if you both submit the link to your forked repository on Moodle before the deadline and attend a demo session. Failure to do either will result in a mark of 0 for the entire coursework.

### Application Marks (75%)

Your objective is to reimplement features from the Moodle platform in your forked repository using Flutter. The features are structured as follows:

| Feature | Description | Marks (%) |
| :--- | :--- | :--- |
| **Basic (40%)** | | |
| [Static Dashboard](https://moodle.port.ac.uk/my/) | Dashboard layout and widgets with static content (hardcoded data acceptable, mobile view) | 10% |
| [Static Navigation Drawer / AppBar](https://moodle.port.ac.uk/my/) | Top app bar and side navigation drawer with menus (links do not have to work at this stage) | 5% |
| [Profile Page](https://moodle.port.ac.uk/user/profile.php) | Static profile view showing your student information, | 5% |
| [Dummy Courses Page](https://moodle.port.ac.uk/my/courses.php) | Page displaying various modules you have (hardcoded data acceptable) | 5% |
| Dummy Course Details Page (use your PAPL or UXDI module, i.e., this module) | Page displaying a few sections of the module, you can use placeholder text, linked copied from Moodle or images that you see on Moodle | 5% |
| [Dummy Assessments Page](https://moodle.port.ac.uk/local/extend/myassessments.php) | Page showing assessments details, their dates and status (hardcoded data acceptable) | 3% |
| [Calendar Page](https://moodle.port.ac.uk/calendar/view.php?view=month) | Section or page showing past or upcoming deadlines/tasks (hardcoded data acceptable, widgets do not need to function) | 4% |
| [Authentication UI](https://moodle.port.ac.uk/login/index.php) | Login page (log out from Moodle and try the link to the left, buttons do not have to function) | 3% |
| **Intermediate (35%)** | | |
| Functioning Navigation | Full navigation across all pages; users should be able to navigate using the drawer, buttons, and URLs | 3% |
| Dynamic Courses Overview Page | Courses overview page populated from data models or services with functioning search or filtering widgets | 6% |
| Dynamic Course Details Page | Course topics and materials populated from data models or services with functioning expand/collapse or filtering widgets (you need to have at least one page fully functioning) | 6% |
| Functional Assignment Submission | Assignment pages populated from data models or services with functioning text fields, file attachments, and local submission updates (you can recreate the assignment section for this coursework) | 6% |
| Interactive Calendar | A functional calendar or list widget allowing users to filter upcoming tasks by date or view deadlines dynamically (the deadline for this coursework must be accurately displayed) | 6% |
| [Notifications / Announcements Panel and Page](https://moodle.port.ac.uk/message/output/popup/notifications.php) | Working messaging drawer or notification side-panel displaying a list of alerts or system announcements | 3% |
| Responsiveness | The layout of the application should be adaptive, and the application should function on desktop in addition to mobile view | 5% |
| **Advanced (25%)** | | |
| Authentication System | Full user authentication and account management (you must use Firebase Auth and enable Google Login) with persistent profile details | 15% |
| Global Search | Complete search functionality across courses, resources, or activities from the AppBar or dashboard | 10% |

*\*Hardcoded data refers to data written directly in code files rather than fetched from a live database. \*Dummy data is data generated for testing and illustration purposes.*

### Software Development Practices Marks (25%)

| Feature | Description | Marks (%) |
| :--- | :--- | :--- |
| **Git** | Regular, small, meaningful commits to your repository throughout development; clear commit messages | 40% |
| **README** | A comprehensive, well-formatted and accurate README file (delete the template README first) | 30% |
| **Testing** | Tests covering all or almost all of the application; passing tests | 20% |
| **External Services** | Integration and utilisation of cloud services (at least two services, e.g., Auth, DB, Hosting) | 10% |

---

## Submission and Demonstration

**Submission:** Submit the link to your public forked repository on Moodle before the deadline. Open the Moodle page, locate the submission page for referral/deferral and paste your link into the editable Online Text field.

**Demonstration:** The demos will take place online. You need to book your meetings **by 27th of July** using [this link](https://outlook.office.com/bookwithme/user/e0acc34f2ca040b295fb20cfce7425a2@port.ac.uk/meetingtype/qZuY5y_IuUimqFEq4d1oDA2?anonymous&ismsaljsauthenabled&ep=mlink). You will have up to 10 minutes to run your app live from a fresh clone and answer technical questions regarding your code and architecture.
