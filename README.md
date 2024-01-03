# CounterAppSolution_KJBN

#Author::
Chaitra M Angadi
04-01-2024
Flutter Developer


Problem Statement:
Develop a single page mobile app using Flutter (page layout as shown in the image below ) and
compile as well as run it on both Android & iOS emulators, or devices. Submit all the artifacts to complete your
first round of interview that are mentioned at the end of this document.

Requirement:
● Widget 5 should be tappable / button
● Widget 4 should be a circular timer which resets automatically after 5 seconds
● Widget 3 Shows success or failure message with score & attempts
● Widget 1 Shows seconds from current time
● Widget 2 Shows random number between 0 - 59

Approach:
According to the requirement, 
- Before loading the screen added the splash screen where i added flutter logo for 3 sec while loading.
- For the Countdown time i have used the AnimationController With extendeding the class with the TickerProviderStateMixin
- For showing the current second and the random number i have used the container to represt the ui as per design where  i am getting the current second from the controller giving the 5 second duration and for the random number i have used the abstract Random class from the dart:math library and generated the rand0m number on the each click of the click button
- Using the Circular progress indicator i am represting the timer and count down
- On Click Button i am checking the required condition of the time out and attempts counts and success count by comparing the current second and random number.

