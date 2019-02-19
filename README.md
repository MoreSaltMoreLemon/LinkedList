#Linked List Readme

#Goals

* Implement a linked list data type
* Include from the Enumerable module
  * implement #each, #<=>, and #to_s methods for compatibility
* Implement useful methods including:
  * push
  * pop
  * shift
  * unshift
  * insert
  * insert_before
  * insert_before(node)
  * insert_after(node)
  * delete
  * head
    * alias: first
* Methods should be consistent and compatible with common ruby methodology

* Write test suite using RSpec and following TDD practices

# Status

* methods are penciled in with intended signatures and a brief description
* `Node` class has RSpec tests as initial learning moment
* `LinkedList` has `initialize` method and corresponding tests
* fleshing out tests for other methods
* added the push method and tests
* added the pop method and tests
  * made it accept no arguments or an integer

#Issues and Questions encountered so far:
* `next` keyword when used as argument name doesn't work terribly well. It is a reserved keyword. D'oh.
* Unsure of how to follow TDD methodology: should I write a complete as possible test suite, or should I write the tests as I flesh out each method? I'm running into an issue where things are inter-related and I'm not sure how to write tests for them without making some of the other methods first. Since it's my first go around writing tests, I'm not certain if my tests will actually *work*, which is a problem as I may fail them for reasons other than the code I write to test against. Fun!
* I'm not great at staying within the intended bounds of a git feature branch...gotta work on that or being more flexible in my branch naming