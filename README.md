# Challege Definition 🔎

I'm currently working with a legacy app that includes a list view for displaying ads to customers. As part of my responsibilities as an iOS developer, I've been asked to redesign and refactor the FilterPage. There is no tests and with the Controller containing more than 3,000 lines of code in the real world, it's proving challenging to write additional tests.

Another issue that I've noticed is the shared "SearchParameters" class, which passes between different controllers and contains a lot of complex logic. This has only added to the overall complexity of the app.

In order to address these challenges, I'm exploring options for refactoring the app architecture and improving overall code quality.

## Specs ✅
 - [ ] Write tests for "AdViewController"
 - [ ] Create dependency graph
 - [ ] This new filter should be in a separate module.
 - [ ] We want to refactor the code as much as possible during this task.

## My Challenges 🎑
 - What is best approach for refactoring this code?
 - How to write tests for this massive ViewControllers with hundreds of dependencies?