# PasswordGeneration
In this assignment you will get familiar with iOS Table Views, Concurrency, and Passing
data between ViewControllers

Part 1 : Password Setup View Controller (50 Points)
The interface should be created to match the UI presented in Figure 1(a). The
requirements are as follows: 
1. This interface enables the user to select the number of passwords to be generated
and the length of these passwords.This view controller should be embedded in a
navigation controller to provide the transition to the Passwords list View Controller.
2. Upon clicking the “Create Passwords” button, the app should check it the user has
entered a valid number of passwords and has selected a strength level (length). If
any input is missing, you should display an alert dialog indicating the error. Else
transition to the Passwords list ViewController and pass the required data.

Part 2 : Password Setup View Controller (50 Points)
The interface should be created to match the UI presented in Figure 1(b). The
requirements are as follows:
1. This view controller should generate the passwords list which should be created in
the background in a child thread. Then the result should be passed to the main thread
and displayed in the Table View and shown in the figure.
2. Upon selecting a password from the list, the view controller should transition back to
the previous view controller and display the selected password in the Password
Setup view controller.
