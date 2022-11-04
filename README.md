# resume

A flutter app for ongoing HNG9 intenship. This app simply displays a users information and his super powers. Super powers here refer to his tech stacks. 



# Preview
![darkmode](https://user-images.githubusercontent.com/34977309/200049608-a525848b-4e22-4eb4-938f-ffe53ffc99e2.png)
![lightmode](https://user-images.githubusercontent.com/34977309/200049632-39dea2e4-4186-4f61-9158-ad6a87e72551.png)
![welcomePage](https://user-images.githubusercontent.com/34977309/200049643-297877fd-55e5-4488-81c8-808b24a58479.png)
![settings](https://user-images.githubusercontent.com/34977309/200050001-1cdb84d0-96d6-413d-866c-d436c7ba59f2.png)

## Features

* Dark Mode: You can switch between Light or Dark theme
* Multi-Language: Can swtich between English or French. Phone inintial language as default
* Profile Display
* Welcome Screen: Landing screen with a few headsup about the app
* Routing
* Social Media Linking

## Technology Used
<img src="https://img.shields.io/badge/flutter-Dart-blue" alt="made with flutter">

<img src="https://img.shields.io/badge/version-0.1.0-orange.svg" alt="1.0.0">

## Architecture used
This app is setup to use MVVM(Model-view-view-model) Architecture. Each view is tighly depended to its view model. This way logic is not scattered around at the widget level.   Due to the fact that this app is limited in features and pages, this architecture is not tightly implemented yet.


  **i. Naming Convention**

|Naming Convention|Effective Style|Example|   
|-----------------|---------------|-------|
|Classes, enum types,typedefs,and type parameters,etensions|PascalCase^1|An example is HomeScreen|
|Libraries, packages, directories, and source files, import prefixes|snake_case|An example is home_screen|
|Class members, top-level definitions, variables, parameters, and named parameters, constants|camelCase|An example is verifiedUser|

## Design

3 page app with a design soely imagined and inspired from youtube video
- [Resume flutter app](https://docs.flutter.dev/get-started/codelab)

## Packages Used

* Shared_preference : Used to persist Language and dark theme settings, so that after closing and openeing, it regains state

   
* url_launcher: This permits resume to open links in the app

* go_router: Functional way for navigating withing pages with ease

* intl: A helper package so facilitate localization i.e the way the app is translated

* Provider: A state management solution. Helps us easily change the state of a variable at particular period of the life cycle.

## Features which could be added

* Authentication (Anonymous/Auth)
* User Role(normal user/employer)
* A user can create a resume(Profile)
* User  can see other profiles 
* user can chat with other user which profile fits a job description and setup a remote or live interview
* Share profile with other users and other platforms
* Search for user profiles based on a particular tech stack(super hero)

## APK LINK 

[Resume](https://docs.flutter.dev/get-started/codelab)

## Challenges

* Responsiveness: Had a tough time making the app responsive, so i used **LayoutBuilder Widget**. With this, i could get the page constraints and rebuild my ui depending on the size i find myself





## New to Flutter/Dart

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
