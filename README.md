# Challege Definition 🔎

I have a legacy app and I tried to demonstrate the setup and objects in this sample project. Basically, this app contains a list view that shows ads to customers. As an iOS developer, I have been asked to redesing and refactor the FilterPage. As you can see for new functionality other  developers add TCA(The Composable Architecture) infrustructure to the ViewController and now sometimes variable change by reducer and some times from Controller and It is hard to debug. Also there is only test for new functionality that is added with TCA architecture and it is very hard to write test for this massive(not in this project but in real world more than 3000 lines of code) Controller.

## Specs ✅
 - [ ] This new filter should be in a separate module.
 - [ ] We want to refactor the code as much as possible during this task.

## My Challenges 🎑
 - What is best approach for refactoring this code. Should be done via TCA or first decouple and get things ready and then convert it to TCA?
 - How to write tests for this massive ViewControllers with hundreds of dependencies?
 - How to reflect our current design and solution we came up with in diagrams.