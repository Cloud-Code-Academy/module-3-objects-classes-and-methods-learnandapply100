/**
 * The ClassesObjectsMethods class serves as an exploration into Object Oriented Programming in Apex.
 * It covers fundamental aspects such as class instantiation, method creation, encapsulation, and object interaction.
 *
 * This class introduces developers to the concept of creating and manipulating objects in Apex. It discusses
 * how to define classes, create methods, and use objects. This class uses two example classes - Person and Book.
 * 
 * Topics covered in this class include:
 * - Understanding how to define a class in Apex.
 * - Understanding how to create methods in Apex.
 * - Understanding how to instantiate objects of a class.
 * - Understanding encapsulation and the importance of getter and setter methods.
 *
 * Users of this class can expect to gain a strong understanding of Object Oriented Programming in Apex and
 * be prepared for more advanced topics in Salesforce development.
 * 
 * The Person class is a simple representation of a person with properties like name and age, and a method
 * that allows the person to introduce themselves.
 * 
 * The Book class is a simple representation of a book with properties like title and author, and methods
 * to read and close the book.
 * 
 * Resources:
 * String class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
 * Date class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * Math class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
 * Classes: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_understanding.htm
 *
 * @author Neha Mansinghka
 */

public with sharing class ClassesObjectsMethods {
    
    /**
     * Question 1
     * It initializes a String to "Hello, Salesforce!" and demonstrates usage of
     * the length, substring, and toLowerCase methods of the String class.
     * Example: practiceStringMethods() should return a list like ["17", "Hello", "hello, salesforce!"].
     * @return A list containing the length of the string, a substring of the string, and the string in lower case.
     */
    public static List<String> practiceStringMethods() {
       
        String myStr = 'Hello, Salesforce!';
        List<String> result = new List<String>();

        // Getting the length of the string
        Integer myStrLength = myStr.length();
        // Getting the substring of the string (first five characters)
        String myStrSubstring = myStr.substring(0, 5);
        // Getting the string in lower case
        String myStrLowerCase = myStr.toLowerCase();

        // Adding the length of the string to the list
        result.add(String.valueOf(myStrLength));
        // Adding the substring of the string (first five characters) to the list
        result.add(myStrSubstring);
        // Adding the string in lower case to the list
        result.add(myStrLowerCase);

        return result;
    }

    /**
     * Question 2
     * Check if the input string starts with 'Sales', ends with 'Force', and contains 'Awesome'.
     * Example: checkStringContent('Salesforce is Awesome!') should return a list like [true, false, true].
     * @param input The input string.
     * @return A list of boolean values indicating whether the string starts with 'Sales', ends with 'Force', or contains 'Awesome'.
     */
    public static List<Boolean> checkStringContent(String input) {
        List<Boolean> results = new List<Boolean>();
    
        //Checking for invalid input
        if(input == null || input == ''){
            return null;
        }

        // Checking if input string starts with the given word
        results.add(input.startsWith('Sales'));
        // Checking if input string ends with the given word
        results.add(input.endsWith('Force'));
        // Checking if input string contains the given word
        results.add(input.contains('Awesome'));

        return results;
    }

    /**
     * Question 3
     * Take a sentence then remove any duplicate words, and return the sentence with only unique words.
     * Example: removeDuplicateWords('Hello Hello Salesforce Salesforce') should return 'Hello Salesforce'.
     * @param sentence The input sentence.
     * @return A string consisting of only unique words from the input sentence.
     */
    public static String removeDuplicateWords(String sentence) {
        List<String> originalWords = new List<String>();
        List<String> wordsWoutPunctuation = new List<String>();
        Map<String, String> wordsMap = new Map<String, String>();
        List<String> orderedUniqueWords = new List<String>();
        Set<String> wordSet = new Set<String>();

        // Checking for invalid inputs
        if(sentence == null || sentence == ''){
            return null;
        }
    
        // Splitting both the original and no punctuation version of the sentence into individual words lists
        originalWords = sentence.split(' ');
        wordsWoutPunctuation = (sentence.replaceAll('[^a-zA-Z0-9 ]', '')).split(' ');
    
        // Using a Map to track original words and their cleaned version i.e. word with no punctuation
        // Key is cleaned word, value is original word
        // Adding each element from the wordsWoutPunctuation list to the map as key and corresponding element
        // from the originalWords list as value
        // As Maps automatically overwrite duplicate keys, so the last occurrence in case of duplicate words 
        // will be kept
        for (Integer i = 0; i < wordsWoutPunctuation.size(); i++) {
            // Every time we see a word, we overwrite it in the map
            // So the last occurrence (with its punctuation) will always be kept
            wordsMap.put(wordsWoutPunctuation[i], originalWords[i]);
        }
    
        // Using a separate list orderedUniqueWords to maintain original word order
        // Using a Set wordSet to track unique words
        // Iterating through the words without punctuation list, if word not present in the wordSet, adding it to
        // the Set. Also retrieving the value from the wordsMap using this word as the key i.e. original version
        // of the word with punctuation and adding it to the orderedUniqueWords list
        for (Integer i = 0; i < wordsWoutPunctuation.size(); i++) {
            if (!wordSet.contains(wordsWoutPunctuation[i])) {
                wordSet.add(wordsWoutPunctuation[i]);
                // This will fetch the last occurrence of the word from the map
                orderedUniqueWords.add(wordsMap.get(wordsWoutPunctuation[i]));
            }
        }
    
        return String.join(orderedUniqueWords, ' ');

    }

    /**
     * Question 4
     * This method takes a string as a parameter, and calculates the number of vowels in the string.
     * For simplicity, we will consider only five vowels: 'a', 'e', 'i', 'o', 'u', and we will ignore case.
     * Example: countVowels("Hello World!") should return 3
     * @param s The string in which to count vowels.
     * @return The number of vowels in the string.
     */
    public static Integer countVowels(String str) {
        Integer numVowels = 0;
        List<String> vowelList  = new List<String>{'a', 'e', 'i', 'o', 'u'};

        // Checking for invalid inputs
        if(str == null || str == ''){
            return null;
        }
    
        // Converting the input string to lowercase to ignore case
        String lowerStr = str.toLowerCase();
    
        // Iterating through the input string. Getting each character and checking if it is a vowel
        // If it is a vowel, incrementing the numVowels counter
        for (Integer i = 0; i < lowerStr.length(); i++) {
            String character = lowerStr.substring(i, i + 1);
        
            if (vowelList.contains(character)) {
                numVowels++;
            }
        }
    
        return numVowels;
    }

    /**
     * Question 5
     * Given a list of scientist names, combine their names together with a comma if it contains the letter 'g'.
     * The final string should not end with a comma.
     * Example: findTheScientist() should return "Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking"
     * @return A string containing the names of scientists that contain the letter 'g'.
     */
    public static String findTheScientist() {
        // The list of scientists' names
        List<String> scientistNames = new List<String>{'Tim Berners-Lee', 'Alan Turing', 'Grace Hopper', 'Donald Knuth', 'Guido van Rossum', 'Ken Thompson', 'Stephen Hawking'};

        // List to store names that contain the letter 'g'
        List<String> result = new List<String>();
    
        // Iterating through the list of scientists' names and checking if the name contains 'g'
        // Adding name to the results list if it does
        for (String name : scientistNames) {
            // Checking if the name contains 'g' - ignoring case so 'G' is also matched
            if ((name.toLowerCase()).contains('g')) {
            result.add(name);
            }
        }
    
        // Joining the names with a comma
        return String.join(result, ',');
    }

    /**
     * Question 6
     * This method calculates the absolute value of the difference between of two input numbers that are raised to the 2nd power.
     * Example: calculateDifferenceOfSquares(3, 4) should return 7.
     * @param a The first number.
     * @param b The second number.
     * @return The absolute value of the difference
     */
    public static Double calculateDifferenceOfSquares(Double a, Double b) {

        // Checking for invalid inputs
        if(a == null || b == null){
            return null;
        }

        // Squaring the inputs, subtracting them and taking the absolute value of the difference
        return Math.abs(Math.pow(a, 2) - Math.pow(b, 2));
    }

    /**
     * Question 7
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
     */
    public static Integer generateRandomNumber() {
        Integer randomInteger;

        // Using Math.random to generate a random number between 0.0 and 1.0 and scaling it by 50 to give
        // a number between 0 and 50. Casting it to an Integer and adding 50 to get an integer between 50 and 100.
        randomInteger = 50 + (Integer)(Math.random() * 50);

        return randomInteger;
    }

    /**
     * Question 8
     * Format the current date in the current user locale format.
     * Example: getCurrentDate() should return a string like "3/21/2001" for US locale users. Locale/String may differ depending on your location.
     * @return The current date in the current user locale format.
     */
    public static String getCurrentDate() {

        return Date.today().format();
    }

    /**
     * Question 9
     * Given a date time return the day of the week in number format
     * @param dt the current date and time
     * @return The number of the day of the week for the given date.
     */
    public static String getDayOfWeek(DateTime dt) {

        // Checking for invalid inputs
        if(dt == null){
            return null;
        }

        Map<String, String> dayOfWeekMap = new Map<String, String>{
        'Monday' => '1',
        'Tuesday' => '2',
        'Wednesday' => '3',
        'Thursday' => '4',
        'Friday' => '5',
        'Saturday' => '6',
        'Sunday' => '7'
        };

        // Getting the day name using .format('EEEE') method of DateTime class and retrieving the day of the week 
        // number value from dayOfWeekMap
        return dayOfWeekMap.get(dt.format('EEEE'));
    }


    /**
     * Question 10
     * Calculate the difference between the years of two dates
     * For example, if the first date is 2023-01-01 and the second date is 2025-12-31, the method should return 2
     * If either of the dates is null, return null.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The a positive number years between the two dates, or null if either date is null.
     */
    public static Integer calculateYearDifference(Date d1, Date d2) {

        // Checking for invalid inputs
        if(d1 == null || d2 == null){
            return null;
        }

        // Getting year of each date and subtracting them
        // Getting absolute value of the difference in case the first date is after the second date
        return Math.abs(d2.year() - d1.year());

    }

    /**
     * Question 11
     * The Book class represents a book in a library. 
     * Each Book object has a title and an author, and methods to return these details.
     * This class can be used in the context of a library management system, bookstore, etc.
     * where you need to manipulate and manage book information.
     */
    public class Book {
        // Declare three public instance variables - title, author, pages
        public String title;
        public String author;
        public Integer pages;
    
        // Book constructor to initialize the title and author
        public Book(String title, String author) {
            // Initialize the title and author
            this.title = title;
            this.author = author;
        }
    
        // Method that returns the details of the book
        public String getBookDetails() {
            // return A string containing the details of the book in the format "Title: <title>, Author: <author>"
            return ('Title: ' + title + ', Author: ' + author);
        }
    }
    

    /**
     * Question 12
     * Create a Book object and returns the details of the book.
     * For example, createAndGetBookDetails() should return a string like "Title: A Brief History of Time, Author: Stephen Hawking".
     * @return A string containing the details of the book.
     */
    public static String createAndGetBookDetails() {
        // Create a Book object with title "A Brief History of Time" and author "Stephen Hawking"
        Book myBook = new Book('A Brief History of Time', 'Stephen Hawking');

        // Call the getBookDetails method on the book object to get the details of the book
        return myBook.getBookDetails();
    }

    /**
     * Question 13
     * Create and update two Book objects and returns the books.
     * For example, generateBookList(Book) should return a list like ["Title: Harry Potter and the Chamber of Secrets, Author: J.K. Rowling", "Title: A Brief History of Time, Author: Stephen Hawking"].
     * Update Book 1 values: title = "Harry Potter and the Chamber of Secrets", author = "J.K. Rowling", pages = 352
     * Book 2 values: title = "A Brief History of Time", author = "Stephen Hawking"
     * @param myBook1 The first book object.
     * @return return a list of books.
     */
    public static List<Book> generateBookList(Book myBook1) {
        // Create a list of books
        List<Book> bookList = new List<Book>();

        // Checking for invalid input
        if(myBook1 == null){
            return null;
        }
      
        // Update the title and author of myBook1
        // Update the pages for myBook1 to 352
        myBook1.author = 'J.K. Rowling';
        myBook1.title = 'Harry Potter and the Chamber of Secrets';
        myBook1.pages = 352;
  
        // Create a new Book object with title "A Brief History of Time" and author "Stephen Hawking"
        // Update the pages for A Brief History of Time to 256
        Book myBook2 = new Book('A Brief History of Time', 'Stephen Hawking');
        myBook2.pages = 256;
        

        // Add the books to the list
        bookList.add(myBook1);
        bookList.add(myBook2);
        
        return bookList;    
    }


    /**
     * Question 14
     * The Person class represents a person.
     * Each Person object has a name and an age, and methods to return these details.
     * This class can be used in the context of a school, college, etc.
     * where you need to manipulate and manage person information.
     */
    public class Person {
        // Declare private two instance variables - (TEXT) name and (Number) age
        private String name;
        private Integer age;
        
        // Constructor to initialize the name and age
        public Person(String name, Integer age) {
            this.name = name;
            this.age = age;
        }
    
        // Method introduceYourself that returns the details of the person        
        // Return a string in the format "Hello, my name is <name> and I am <age> years old."
        // For example, introduceYourself() should return a string like "Hello, my name is John Doe and I am 28 years old."
        public String introduceYourself() {
            return 'Hello, my name is ' + name + ' and I am ' + age + ' years old.';
        }

        // Getter method that returns the name of the person
        public String getName() {
            return name;
        }

        // Getter method that returns the age of the person
        public Integer getAge(){
            return age;
        }

        // Setter method that sets the name of the person
        public void setName(String name) {
            this.name = name;
        }

        // Setter method that sets the age of the person
        public void setAge(Integer age){
            this.age = age;
        }
    }

    /**
     * Question 15
     * Create a Person object and returns the details of the person.
     * For example, personDetails() should return a list like ["Hello, my name is John Doe and I am 28 years old.", "John Doe", "28"].
     * @return A string containing the details of the person.
     */

    public static List<String> personDetails() {
        List<String> results = new List<String>();

        // Create a new instance of Person class
        // Name the person 'John Doe' and set the age to 28
        Person person1 = new Person('John Doe', 28);
        
        // Add the details of the person using the introduceYourself method
        results.add(person1.introduceYourself());

        // Add the name of the person using the getter method
        results.add(person1.getName());

        // Add age of the person using the getter method. Convert age to String
        results.add(person1.getAge().toString());

        return results; // Replace null with the variable you used to store the result
    }

    /**
     * Question 16
     * Create a Person object with the provided name and age.
     * @param name The name of the person.
     * @param age The age of the person.
     * @return A new instance of the Person class.
     */
    public static Person createPerson(String name, Integer age) {

        // Checking for invalid inputs
        if(name == null || name == '' || age == null){
            return null;
        }
        // Create a new instance of the Person class using the provided name and age
        Person newPerson = new Person(name, age);
        
        return newPerson;
    }

    /**
     * Question 17
     * Create a method that constructs multiple Person objects.
     * You are to create a new Person object for each name in the provided List<String> of names,
     * using the same age for all Person objects. The method should return a List<Person> of all the Person objects created. 
     * @param names A list of names.
     * @param age The age to be set for all the Person objects.
     * @return A list of new Person objects.
     */
    public static List<Person> createMultiplePersons(List<String> names, Integer age) {
        List<Person> personList = new List<Person>();

        // Checking for invalid inputs
        if(names == null || names.size() == 0 || age == null){
            return null;
        }

        // Loop through each name in the provided list of names
        for(String name : names){
            // Check name is not empty
            if(!(name.length() == 0)){
                // Create a new Person object for each name
                // Add the new Person object to the list of Person objects
                personList.add(new Person(name, age));
            }
        }
        
        return personList;
    }


    /**
     * Question 18
     * Compare two Person objects based on their ages.
     * If the first Person is older, the method should return the first Person. If the second Person is older, it should return the second Person.
     * If they are the same age, return either.
     *
     * @param person1 The first Person object.
     * @param person2 The second Person object.
     * @return The Person object of the older person.
     */
    public static Person getOlderPerson(Person person1, Person person2) {
        // Checking for invalid inputs
        if(person1 == null || person2 == null || person1.getAge() == null || person2.getAge() == null){
            return null;
        }

        if(person1.getAge() > person2.getAge()){
            return person1;
        } else if(person1.getAge() < person2.getAge()){
            return person2;
        } else {
            // This means person1 and person2 are the same age
            return person1;
        }
    }
}