// This file contains all the notes of the topics given in task and answer to all the 40 questions

# DART NOTES
  .Dart is a programming language used for building applications with flutter .
  .It is object oriented. 
 ## Datatypes-
    .it tells dart what kind of value can be stored in a variable .
    .kinds-
      1. int - it stores numeric value 
         eg- int age =10;
      2. float- it stores floating numbers 
         eg- float marks= 98.23;
      3. string - it stores text.
         eg- string name= "mansi";
      4. bool- it stores two typs of value - true or false .
         eg- bool onTime = true;

 ## Variables 
    .they are the place in a memory that stores/contains a value.
    syntax-
         datatype <variable name> =value;
         eg-
            String name = "mansi";

    .var- it automatically detects the datatype of the variable by the value stored in it and then it is fixed.
    .once the type is assigned it cannot change.
        eg-
           var name= "mansi";
           here it will automatically assign string datatype to the variable.
           now i cant store any other type of value .
    
    . dynamic - it also automatically detects the type of variable by the value stored in it but it can be changed.
        eg-
           dynamic name="mansi";
           name=20;
           name=20.23;
        
    . final - value can be assigned only once .
      eg-
         final name ="mansi";
         now the value stored in name variable cannot be changed .
    
    . const - it used for the value that is known at the compile time 
              and they cant be changed .
        eg-
           const pi= 3.14;
    
 ## Null safety 
    .it helps us to prevent errors caused by using a variable which has no value.
      eg- 
          string name;
          here there is no value assigned to the variable , so when we will try to use it it will show error .
    . we use '?' keyword when we want a variable to contain either a value or null.
      eg-
        string? name;      
    . we use '??' keyword to assign a default value to the variable if no value is assigned.
      eg-
        string ? name=null;
        print (name?? unknown);
        so now it will print unknown instead of null.
    
 ## Lists
    . it stores multiple value in the  [] and seprated using ','.
    . it can contain duplicates
      syntax-
           list <datatype> list_name = [val1, val2, val3....];
      eg-
           list <int> marks =[90,100,80,80];
 ## Sets 
    . it is a collection of unique values.
      syntax-
           set <datatype> set_name = {val1, val2 ,val3.....};
      eg-
           set <int> marks={20,40,80,90,24};
 ## Map
    . it stores balue in the format of key:value pair enclosed in {} and seprated by ','.
      syntax-
           map <key datatype , value datatype> map_name ={key1:val1,key2:val2,....};
      eg-
          map <int , string> student ={1:"mansi",2:"palak"};
          
 ## Functions
    .a function is a block of code that performs a specific task.
    .it helps us avoid writing the same code again and again.
     syntax-
       returnType functionName(parameters) {
         // code
       }
     eg-
        int add(int a, int b) {
        return a + b;
       }
       print(add(10, 20));
      here `add()` takes two values and returns their sum.

 ## Named Parameters
    .named parameters allow us to pass values using the parameter name.
    .they are written inside `{}`.
     eg-
        void student({String? name, int? age}) {
        print(name);
        print(age);
        }
      student(name: "Mansi", age: 20);
    the benefit is that we can clearly see which value is being passed to which parameter.

 ## Optional Parameters
   .optional parameters are parameters that do not have to be provided when calling a function.
   .they are written inside `[]`.
   eg-
     void greet(String name, [String? message]) {
      print(name);
      print(message);
     }
     greet("Mansi");
   here `message` is optional.

 ## Classes
    .a class is a blueprint for creating objects.
    .it can contain variables and functions.
     eg-
       class Student {
      String name = "Mansi";
      void study() {
        print("Student is studying");
      }
      }
    .here `Student` is a class and `name` and `study()` are its members.

 ## Constructors
    .a constructor is a special function that is automatically called when an object is created.
    .it is mainly used to initialize the object.
     eg-
         class Student {
         String name;
         Student(this.name);
         }
         var s1 = Student("Mansi");
    .here `Student(this.name)` is the constructor.

 ## Inheritance
    .inheritance allows one class to use the properties and functions of another class.
    .we use the `extends` keyword.
     eg-
       class Animal {
       void eat() {
        print("Eating");
      }
     }

    class Dog extends Animal {
      void bark() {
        print("Barking");
      }
    }
    .Dog can use both `eat()` and `bark()`.

 ## Abstract Classes
    .an abstract class is a class that cannot be directly used to create an object.
    .it is generally used as a base class for other classes.
    .we use the `abstract` keyword.
     eg-
        abstract class Animal {
        void sound();
    } 

    class Dog extends Animal {
      @override
      void sound() {
        print("Bark");
      }
    }
   .the child class provides the implementation of the abstract method.

 ## Mixins
   .a mixin allows us to reuse functions or properties in multiple classes.
   .we use the `mixin` keyword and `with`.
    eg-
       mixin Swimming {
       void swim() {
       print("Swimming");
      }
    }
    class Fish with Swimming {}
   .Fish can use the `swim()` function.
   .simple meaning:
   .mixin = a way to reuse functionality in different classes.

 ## Enums
    .enum is used when we have a fixed set of possible values.
     eg-
       enum Day {
      monday,
      tuesday,
      wednesday
    }

    Day today = Day.monday;
    .here `today` can only contain one of the values defined inside `Day`.

 ## Extensions
    .extensions allow us to add new functionality to an existing class without changing the original class.
     eg-
         extension StringExtension on String {
         String greet() {
        return "Hello $this";
      }
    }
     print("Mansi".greet());
     .here we added the `greet()` function to the existing `String` class.

 ## Futures
    .a Future represents a value that will be available sometime in the future.
    .it is commonly used for operations that take time, such as getting data from an API.
     eg-
         Future<String> getName() async {
         return "Mansi";
        } 
    .the result is not available immediately.

 ## async / await
    .`async` is used to mark a function as asynchronous.
    .`await` waits for a Future to complete and gives its result.
    eg-
     Future<void> getData() async {
      String name = await getName();
      print(name);
    }
     .simple flow:
    Start operation
         ↓
    await result
         ↓
    Use result

 ## Streams
    .a Stream provides multiple values over a period of time.
    .a Future normally gives one result, while a Stream can give many results.
    .example:
           Stream<int> numbers() async* {
           yield 1;
            yield 2;
            yield 3;
         }
   .streams are useful for continuously changing data, such as real-time updates.

 ## Exception Handling
    .exception handling is used to handle errors that may occur while the program is running.
    .Dart mainly uses `try`, `catch`, and `finally`.
     eg-
         try {
          int result = 10 ~/ 0;
          print(result);
          } catch (e) {
          print("An error occurred");
          }
    .`try` = code that may cause an error
    .`catch` = handles the error
    .`finally` = code that runs whether an error occurs or not

 ## Generics
    .generics allow us to write code that can work with different datatypes while still maintaining type safety.
    eg-
    List<int> marks = [90, 80, 95];

    List<String> names = ["Mansi", "Rahul"];

    .here `List<int>` can contain integers and `List<String>` can contain strings.
    .the datatype is specified inside `<>`.

 ## Factory Constructors
    .a factory constructor is a constructor that does not always create a new object.  
    .it can return an existing object or decide which object should be created.
    .we use the `factory` keyword.
     eg-
       class Student {
       String name;
       Student(this.name);
      factory Student.create() {
        return Student("Mansi");
      }
    }
    .`Student.create()` is a factory constructor.

 ## Getters
    .a getter is used to read a value from a class using property-like syntax.
    .we use the `get` keyword.
     eg-
      class Student {
      String name = "Mansi";

      String get studentName {
        return name;
      }
    }

    print(student.studentName);
    .we use a getter when we want controlled access to a value.

 ## Setters
    .a setter is used to change a value of a class using property-like syntax.
    .we use the `set` keyword.
    eg-
    class Student {
      String name = "";

      set studentName(String value) {
        name = value;
      }
    }

    student.studentName = "Mansi";
     .setter = used to set/change a value.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#flutter notes
  
   ## widgets-
     .widgets are the basic building blocks of the flutter application .
     .they define the structure and appearence of the user interface.
     .everyelement which is vissible on the screen is created using widgets.
   
   ## stateless widgets-
      .stateless widget is a type of widget whose properties cant be changed once built .
      .they are immutable .
   
   ## stateful widgets-
      .stateful widgets are type of widget that can modified after creatred.
      .they are mutable.
   
   ## widget tree-
      .              my applications
                         (root)
                            |
                     material apps 
                            |
                       my homepage
                            |
                        scaffold
                            |
             |-----------------------------|
         app bar                         center
                                          |
                                         text
      . scaffold is used for implementing basic material design visual layout structure .
      . app bar is used to create a ba at the top of the screen.
      . text is used to write anything on the screen .
      . center is used to provide center alignment to other widgets.
   
   ## scaffold-
       . it is a class in flutter that provides many widgets .
       .it expands or occupy the whole available space in device screen.
       .properties-
         1. app-bar = horizontal bar at the top .
         2. body = it display main or primary content . it is below app bar.by default on the left side.
         3. floatingActionButton = it a button by default placed at the right side . 
                                   it is a icon button which floats on the screen at a fixed place .
                                   even if we scroll its position will not change.
         4. drawer = it is a slider menu which is displayed at theside of the scafffold.
         5. bottomNavigationBar = it is like a menu at the bottom of the scaffold .we can add multiple icon or text or both in the bar as the item.
         6. bottomSheets = this property takes in a widget as the object to display it at the bottom of the screen.

   ## container-
       .it is one of the most commonly used widgets in Flutter. It is used to hold,style,position,and size other widgets.
       .properties-
          1. child = it stores the child of the container class. it cany be any widget.
          2. color = it sets the background color of the entire container .
          3. height and width = it allows to specify the height and width of a container .
          4. margin = it is used to create emptyspaces around the container.
          5. padding = it is used give space from the border to its childern.
   
   ## list view-
       .it is a scorllable list of widgets arranged linearly. it shows childern sequentially in the scolling direction ,either vertically or horizontly .
       .types-
         1. list view= it simply takes a list of widgets and makes it scrollable.
         2. listView.builder()= builder constructor constructs a repeating list of widgets .
                                it takes two main parameters:
                                1. itemcount= it is for no. of repeatition for the widget to be constructed.
                                2. itembuilder= it is for constructing the widget which will be generated 'itemcount' times.
  
   ## grid view -
      . it is a widget simmillar to 2-D array . it display the content in grid format .
      .we can showcase image, text ,icon and more within the grid . 
      .differents ways to implement rid view=
        1. gridView()
        2.gridView.count()    
        3.gridView.builder()
        4.gridView.custom()
        5.gridView.extent()
    
    ##dialog-
         . it is a type of widget which comes on the screen which contain a critical information or ask for any decision .
         . there are three types of dialog boxes -
           1. alert
           2. simple
           3. show
    
    ##snackbar-
       .it is widget to display a dissmissible pop-up message on the application .
       .it displays the informative message for a very short time and when time is completed it dissappears.

    ## form-
       .it is a widget used to group and manage multiple input fields together.

    ## form validation -
       . it is a function used tocheck whether the data entered by the user is corect or not ?
       . it is mainly used with the textformfield inside a form.
       .it returns an error message if the input is invalid otherwise it returns null.
    
    ## gestures-
       .they are the action that a user performs by interacting with the screen,such as-
         1.tap
         2.doble tap
         3.long press
         4.swipe/drag
         5.pinch/zoom
         6.horizntal drag
    
    ##element tree-
      .it is a structure flutter uses to keep track of where widgets are located in the UI and to connect widgets with thier corresponding rendered object.
      .it is important because when setstate() causes a wiget to rebuild , flter can use existing elements instea of rebuilding everything from scracth.

   ## state-
      .information or data that can change while the app is running.

   ## keys-
      .it helps flutter to identify a particular widget among other widgets.
      .it is like an identifier that helps the flutter to preserve the identity of widget.

   ## build context-
      . it tells Flutter where a widget is located in the widget tree.
      .it is a reference to a widgets location in widget tree.
   
   ## column-
      . it arranges widgets vertically.
      
   ## row-
      . it arranges widgets horizontly.

   ## stack-
      . it allows widgets to placed on top of each other.
      .like- text over image , floating buttons etc.

   ## expanded-
      . it tells a child in a row , column or flex to take available remaining space.
      
   ## flexible-
      . it is simmillar to expand but less strict .
      . it allows child to fit within available space without necessarily forcing it to fill all remaining space.

   ## safearea-
      .it keeps the content away from th areas that might be covered by system UI.
      .it is mainly used around the main content of a screen.

   ## singleChildScrollView-
      . it makes its single child scrollable.
   
   ## inkwell-
      .it makes the widget respond to touch, usually with the ripple effect.
      
   ## media query -
      . it gives information about the current screen/window.
      . provide info such as -
        1. screen/window size
        2. device pixel ratio 
        3. text scalling 
        4. accessibility settings
        5. orientation
        6. display features
      
   ## layout builder-
       . it lets you build the UI based o the space available to that particular widget.
       .it gives contraints available to a particular widget.
       .useful for responsive layout 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# flutter system layout 
  
  ## Constraints-
     .they are the rules that a parent widget gives to its child about how much space the child is allowed to take.
     .it has four imp values-
       1.minwidth
       2.maxwidth
       3.minheight
       4.maxheight
   
   ## parent-child constraint-
      .Flutter follows :
        parent -> gives Constraintsto -> child ->chooses its size ->parent decides ->position child 

   ## height and width-
      . we can set height and width of  widget but it is notnecessary that it will get that size ,because the parents constraint have priority .
      .the child cannot demmand unlimmited space. its actual layout depends upon the contraints suplied by its parent.

   ## mainAxisAlignment-
       . it controls how children are positioned along the axis.
       .row - mainaxis= horizontal
       .column - mainaxis = vertical 
       .imp values-
         1.start- children go towards beginning .
         2.end- children go towards end.
         3.center- children go towards center.
         4.spaceBetween- children have equal space bw them and there is no extra space before first child and after last child
         5.spaceAround- space is placed around each child.

   ## crossAxisAlignment-
      .it controls how children are postioned along the cross axis .
      .if main axis is horizontal then cross axis is vertical and vice versa .
      .imp values-
         1.start- children go towards beginning .
         2.end- children go towards end.
         3.center- children go towards center.
         4.stretch-children stretch accross the available cross- axis space, subject to the constraints.
         5.baseline- useful mainly when aligning text based on its text baseline .
      
   ## row overflow-
      .it happens when the children of a row require more horizontal space than the row has available .
      . if the text is wider than the screen width , flutter may show :
         a RenderFlex overflowed by xx pixels on the right.
   
   ## column overflow-
      .it happens when the children of a column require more vertical space than the column has available .
      . if the image is longer than the screen width , flutter may show :
         a RenderFlex overflowed by xx pixels on the bottom.
 
   ## scorllable widgets-
      . it allows the content that is larger than the available screen to be veiwed by scrolling .
      .it includes-
        1.singleChildScrollView
        2.listView
        3.gridView
        4.pageview

   ## responsive design-
      . it means designing a UI that adapts to different screen sizes and available spaces.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# riverpod
  
   ##what is state and why do we need it ?
     . state is data or condition of an application that can change while the app is running.
     . we need a system that helps us :
       1. store state
       2. change state
       3. share state bw widgets
       4. automatically updates UI when state changes
       5. handle loading and errors
       6. keep business logic outside UI.
       this is called state management.
       basically, it is a process of storing , changing ,sharing,and updating application state in a controlled way.

   ## what is RIverpod?-
      .it is a state mangement and dependency lib for dart and flutter.
      . it allows us to create providers thhat hold or provide application state and logic.
      . it connects UI to application's state.

   ## provider-
      .it is an object that provides something to the application 
      . that something can be:
        1.a value
        2.a service
        3.a repostory 
        4.a controller
        5.appliction state
        6.configuration
        7.another provider
      .it is like a source of something that application need

   ## consumer widget-
      .it is riverpod widget that can access providers.
      . it is a stateless widget provided by riverpod that allows the widgets to read and watch providers using ref.

   ## consumer stateful widget-
      .
   
   ## ref-
      . it is an object riverpod uses to interact with providers.

   ## ref.watch()-
      . it means watch this provider and rebuild or rerun this part when its value changes.
      .Provider changes
              ↓
       ref.watch detects change
              ↓
       Widget rebuilds
              ↓
         New data appears 
         
   ## ref.read()-
      .Give me the current value/provider instance, but don't listen for future changes.
      .doesnt listem to changes.
      . widget doent rebuild becuse of this read
      . non reactive .

   ## Asyncvalue-
      .When an application gets data from the internet, the result isn't immediately available.
      .But the request can also fail.
      . so we have these three common states:
        1.loading
        2.data
        3.error
      .AsyncValue is a Riverpod type used to represent the state of asynchronous data, such as loading, successful data, or an error.

   ## loading state-
       . it means that the application is currently waiting for some asynchronous operation to complete.

   ## data state-
       . it means that the asynchronous operation succeeded and we have the required data.
   
   ## error state-
       . it means that the asynchronous operation has failed .
   
   ## Async notifier -
       . Notifier is used when we need a class that manages state and contains logic for changing that state.
       . An AsyncNotifier is used when that state involves asynchronous operations.
   
   ## Async notifier provider-
      .AsyncNotifierProvider connects an AsyncNotifier to the rest of the Riverpod application.
      . the ui doesnt need to manually manage the states ,instead it observes the async value .

   ## provider dependencies-
      .sometimes provider needs another provider.
      .riverpods allows providers to depend on other providers .
      .it avoids manually creating everything everywhere.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Go Router
  
   ## navigation-
      .it is the process of moving from one screen or page of an application to another.
      .like- login page -> home page -> trip details 

   ## routing-
      .it means defining which url/path corresponds to which screen .
      .route is like an address for a screen.

   ## goRouter-
      .it is a flutter package used to manage navigation and routig .
      .instead of manually deciding naviagtion everywhere in application, we define routes in one routing configuration.

   ## routes-
      .it defines a destination in your application.

   ## named routes -
      . it gives a route a name so that you can refer to that route using its name rather than relaying only on its path.

   ## routes parameters -
      .sometimes we need to send information as part of the route .
      . so these parameters are the dynamic value included in the path of the rout ,usually used to identify a specefic resource.
      . usually identifies which specefic resources we want .

   ## query parameters-
      .they are another way of send informaton through url.
      .they appear after ?.
      .usually provides opptions, filters, or addtional information.

   ## nested routes -
      . a nested route is a route that exists inside another routes.
      . eg-
            home->
                |->trips
                |->bookings
                |->profile
         here home is the parent route and home/trips is the nested route .
      . we need them when screens have logical hierarchy.

   ## redirects-
      . it means instead of allowing the requested route to open directly,the router sends the user to another route.
      . eg- if user tries to open profile and routers checks that user is not logged in so it sends user to login page

   ## authentication guards-
       . it protects routes that should only be accessible to authenticated users.
       . eg- if user try to book a trip but router checks authentication and found authenticated and then allows booking .

   ## go() -
      . it navigates to a location and makes that location the current destination .
      . changes the current naviagtion location.

   ## push()-
       .it adds a new route on the top of the current navigation stack .
       . the previous screen remains underneath.

   ## pop()-
       . it removes the current route from the navigation stack and returns to the previous route .
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#API/Backend
  
   ## API-
      .it stands for Application Programming Interface .
      .it is an interface that allows different softwares systems to communicate with each other.

   ## REST API -
      . REST  stands for Representational State Transfer.
      . A REST API is an API that follows a set of conventions for communicating with resources over http.

   ## HTTP -
      . HTTP stand for Hyper Text Transfer Protocol.
      . it is a communication protocol used to transfer information bw client and a server .
      
   ## client and server-
      . the client is the aplication making the request .
      . the server recives request , processes them ,and sends responses.

   ##  HTTP request -
       . it is a message sent by the client to the server.
       . a request can contain :
         - HTTP method
         -URL 
         -headers
         -query parameters 
         -request body

   ## HTTP response-
      . the server sends the resonse back .
      . a response commonly contains :
        -status code 
        -headers
        -response body

   ## GET -
       .it HTTP method used to retrieve data from a server.
       .it is generally used for reading/retrieving data.

   ## POST-
      .it is an HTTP method commonly used to send data to a server to create a new resource or perform an operation.
      
   ## PUT-
      .It is an HTTP method commonly used to replace an existing resource with a new representation.
      
   ## PATCH-
       . it is an HTTP method used to partially modify an existing resource.

   ## DELETE-
      . it is an HTTP method used to remove a resource.

   ## HTTP status code-
       . when the server responds , it sends a status code.
       .the status code tells us what happened .
       .they are grouped into categories-
         1. 1xx = informational
         2. 2xx = success 
         3. 3xx = redirection
         4. 4xx = client error
         5. 5xx = server error
   
   ## JSON-
       .JSON  stands for Javascript object notation.
       . it is a common format used to exchange data bw applications.
       .flutter recives JSON from API and converts it into Dart objects .

   ## Request body-
      . it contains data that the client sends tothe server.
      . the body is commonly used with:
         -POST
         -PUT
         -PATCH
   
   ## Headers
      . they contain additional info about an HTTP request or response.

   ## Authentication tokens-
      . when a user logs in , the backend may provide an authentication token.
      . the authentication token helps communicate that authenticated identity/session context.

   ## API errors-
      . an API request can fail. 
      .the flutter application should handle these cases instead of assuming every request succeds 

   ## serialization and deserialization -
      . serialization is converting dart objects into JSON request.
      .deserialization is coverting JSON request into dart objects.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Database
   
   ## Database-
      . it is a orgnized system for storing and managing data.

   ## postgreSQL-
      .it is a relational database management system(RDBMS).
      .it stores stuructured data in tables and supports relationship bw those tables.

   ## Tables-
      .A table stores related data in rows and columns.
      
   ## Rows-
       .A row represents one record/entity in a table.

   ## column-
      .A column represents a particular type of information stored for each record.
   
   ## Primary key -
      .A primary key is a column or set of columns that uniquely identifies each record in a table.

   ## Foreign key-
      .A foreign key is a field that references a key in another table to establish a relationship between records.

   ## Relationships-
      .Tables often need to be connected.
      .There are three major relationship types-
         1. one to one =  it means each record in one table is associated with at most one corresponding record in another table, and vice versa.
         2. one to many=  it means one record in one table can be associated with multiple records in another table.
         3. many to many= it means many records in one table can be associated with many records in another table.
   
   ## Indexes-
      .A database index is a data structure that can improve the speed of data retrieval for specific queries, at the cost of additional storage and write overhead.
      .indexes are not automatically beneficial for every column.

   ## Transactions-
      .A transaction is a group of database operations that are treated as a single unit of work, so the database can maintain consistency if something fails.

   ## Constraints-
      .A constraint is a rule applied to database data.
      .Common constraints include:
         -PRIMARY KEY
         -FOREIGN KEY
         -UNIQUE
         -NOT NULL
         -CHECK
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Prisma

   ## what is Prisma?
      . Prisma is an ORM/toolkit used by the backend application to work with databases.
      . ORM means: Object-Relational Mapping
      . Instead of writing raw SQL for every database operation, application code can use Prisma's generated API to interact with the database.
   
   ## why we use prisma?
      . Prisma handles translating application-level database operations into database queries.
      .It also provides features around:
          -schema definition
          -type safety
          -database access
          -migrations
          -relationships
   
   ## prisma schema-
       .Prisma uses a schema to describe models.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#part 8
  After studying the website carefully-
  ## Understand what Onyatrips is trying to solve?
    
    Onyatrips believes that travel is not broken because people don't want to travel, but because people find it 
    difficult to decide where to go, what to choose, and who to travel with.

    The company identifies 11 major failures of the travel internet, which can be grouped into 3 categories:

      1. Failures of Trust-
         Fake/incentivised reviews make good and bad places look similar.
         Paid "Top 10" lists can look like genuine recommendations even when they are advertisements.
         When almost everything has 4.5+ ratings, ratings stop being useful for comparison.
         Tourist traps are designed mainly to attract tourists rather than provide a genuinely good experience.
      2. Failures of Decision-Making
          Decision fatigue: Too many options make choosing harder.
          Information overload: People have to go through many blogs/posts that often repeat the same information and photos.            Comparison paralysis and choice anxiety: People become afraid of making the wrong choice.
         Generic recommendations: Recommendations often come from people whose budget, preferences, and travel style are different from the user's.
      3. Failures of Company
         Solo travellers may intentionally travel alone but can still want someone to share experiences with.
         Finding a suitable travel companion is still mostly done through WhatsApp groups, Facebook groups, or random connections.


   How Onyatrips Solves These Problems

      The first two categories are addressed by Places:
        helping users discover and decide on places with more useful/trustworthy information.
      The third category is addressed by Companion:
        helping solo travellers find suitable people to travel with.
      Therefore, Onyatrips has two main halves: Places and Companion, and both are considered equally important to the product.
   
   ## The major experiences 
      . Authentication
            Sign up/login using email + password or Google.
            Email login uses an OTP.
            Passwords and OTPs are stored as hashes.
            Access token: 15 minutes; refresh token: 7 days.
            Optional LinkedIn verification.
            “Verified” does not mean government-ID or background verification.

            Simple meaning: Authentication securely controls account access.

         2. Onboarding
             Converts an account into a traveller profile.
             User enters personal details like name, age, profession, college/company, photo, bio and interests.
             Also enters travel preferences like destination, dates, budget-related preferences, diet, pace, transport, sleep cycle, etc.
             Profile completeness affects whether the user can be discovered by others.

            Simple meaning: Onboarding collects the information used for the user's profile and matching.

         3. Home
            Main starting screen of Onyatrips.
            Gives two choices:
            People → find a travel companion.
            Places → explore Places/waitlist.
            It is not an endless feed.

            Simple meaning: Home directs users to the two main parts of the product.

         4. People Discovery
            Main Companion section is /companion.
            Has two views:
            Groups
            Individual
            Users switch between them using a toggle.

            Simple meaning: Users can either find an existing trip or find individual travellers.

         5. Groups
            Groups are already-created trips.
            Trip contains destination, dates, origin, budget, description, seats, price and preferences.
            User can request to join.
            Organiser can accept/reject.
            Request states: pending, accepted, rejected, cancelled.
            After acceptance, user enters the group chat.

            Flow:
            Browse → Request → Accept → Group Chat

         6. Individual Travellers
            Shows traveller profiles, not existing trips.
            User can view someone and send a connect request.
            After acceptance, they can message each other.
            A traveller listing is basically the user's profile shown when they have a planned trip.
            Visibility depends partly on gender preferences.

            Flow:
            Browse person → Connect request → Accept → Message

         7. Traveller Filters
            Filters help users find more suitable trips or people.
            Groups: destination, dates, budget, seats, vibe, transport, smoking/drinking, sleep cycle and organiser preferences.
            Individuals: destination, dates, budget, gender, age, profession, college/company, diet, traveller type, transport and other preferences.
            Current matching is not AI-based.
            It uses database queries and user-provided fields.

            Simple meaning: Filters narrow down the available trips or travellers.

         8. Add Myself
            Allows a user to become discoverable as an individual traveller.
            User completes their profile and gets listed.
            For Groups, the equivalent is Create a Trip.

            Simple meaning: It changes the user from only browsing to also being available for others to discover.

         9. Connect
            Users cannot directly message strangers.
            A request must be accepted first.
            Groups: Request to join → Accept → Group chat
            Individual: Connect request → Accept → Message
            Requests have states like pending, accepted, rejected and cancelled.
            Simple meaning: Connect acts as a permission step before communication.

         10. Chat
            Two types:
            One-to-one chat
            Group chat
            Messages are delivered in real time.
            Messages are currently not end-to-end encrypted.
            There is no automatic moderation or in-app report/block button yet.
            Safety issues can be reported through feedback/email.

            Simple meaning: Chat allows connected travellers and accepted group members to communicate.

         11. Places
            Places is the second major part of Onyatrips.
            Focuses on curated destinations.
            Uses 10 categories.
            Places is currently not fully open; /places is a waitlist page.

            Simple meaning: Places helps users discover selected destinations instead of listing everything.

         12. Place Details
            A place page can show:
               Category
               Badge
               Location/map
               Traveller reviews
               Bucket-list option
               Booking option, where available

            Rev iews contain a 1–5 star rating + comment and are public with the reviewer's name and photo.

            Simple meaning: Place details explain why a particular place is worth considering.

         13. Trips
            Users can Create/Plan a Trip.
            Add destination, origin, dates, budget, description, vibe, group size, seats and price.
            Organiser manages join requests.
            Accepted members can use the group chat.
            Organisers are expected to describe trips accurately and communicate honestly.
         
         14. Finance
            Paid bookings currently exist for:
            Group-trip seats
            Bookable Place slots
            Payments use Razorpay hosted checkout.
            Onyatrips does not store card numbers, CVV, UPI PIN or bank details.
            Server calculates the final price.
            Payment webhooks are signature-verified.
            There is currently no expense-splitting feature.

            Simple meaning: Finance handles payments for the two currently paid booking flows.

         15. Profile

            The profile has three roles:
               User identity
               Traveller listing
               Filter information

            Others can see the user's photo, name, bio, interests, travel preferences, groups and reviews.

            Reviews show the user's name and photo, so they are not anonymous.

         16. Settings

            Users can:
               Edit profile details.
               Control marketing/activity emails.
               Manage cookie/analytics preferences.

            Currently, users cannot directly delete their account or export their data. They need to contact support.

         17. Notifications
            Two main channels:
               In-app/real-time: chats and notifications.
               Email: OTP, password reset, welcome and activity emails.
            
            Marketing/activity emails can be turned off, but security emails like OTPs cannot.
   
   ## 4. How Features Connect
         Main flow:

            Authentication → Onboarding → Profile → Home

         People flow

            People → Groups/Individual → Filters → Traveller/Trip → Connect → Chat

         Places flow

            Places → Categories → Filters → Place Details

         Both sides connect through Trips, Finance, Reviews, Profiles and Notifications.
         Simple meaning: Onyatrips has one common user/profile system that branches into People and Places.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Part 9

   1. People vs Places Concept

      Onyatrips is based on two main questions:
         People → “Who should I travel with?”
         Places → “Where should I go?”
   
      People
         The People/Companion side helps travellers find other people to travel with.
      Flow:
         People → Groups / Individual Travellers → Filters → Profile/Trip → Connect → Chat
         It focuses on:
            Finding compatible travellers
            Joining existing trips
            Creating connections
            Getting consent before chatting

      Places
         The Places side helps travellers decide where to go.
      Flow:
         Places → Categories → Filters → Place Card → Place Details
         It focuses on:
            Curated destinations
            Different travel categories
            Place evaluation
            Reviews, maps, badges, and booking information where available

      Simple meaning:
         People = Who will I travel with?
         Places = Where will I travel?
         Both sides are designed to reduce the huge number of choices and help the traveller reach a smaller, more useful set of options.

   2. Groups vs Individual Travellers
         The main difference is:
            Group = Join an existing travel plan
            Individual = Find a person and make a plan together

                        Groups	                             Individual Travellers
            An existing trip/plan already exists	   A traveller/profile already exists
             You request to join	                     You request to connect
            Organiser decides whether to accept	      Either person can accept or decline
             Seats may be limited                  	No seat limitation
             Focus is on the trip + organiser        	Focus is on the person + compatibility
            Accepted → Group chat	                  Accepted → One-to-one chat
            Can involve payment for a seat	         No platform payment for the connection
      
      Example
      Group:
            A person has created a Jaipur trip for 5 people. You find it through filters and send a Join Request. The organiser accepts → you enter the group and can chat.
      Individual:
            You find another traveller who has similar interests and travel preferences. You send a Connect Request. They accept → you can chat and potentially plan a trip together.

      Simple meaning:
      Groups = “Can I join your trip?”
      Individual = “Can we travel together?”

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# answer to the 40 questions-
  Q1 What is Dart?
  A1 Dart is a programming language developed by Google. It is mainly used with Flutter to build applications. It supports variables, classes, functions, async/await, null safety, and object oriented programming.

  Q2 What is Flutter?
  A2 Flutter is a UI framework developed by Google. It is used to build applications for Android, iOS, web, and desktop using one codebase. Flutter uses Dart as its programming language.

  Q3 Why does Flutter use widgets?
  A3 Flutter uses widgets to build almost every part of the user interface. Text, buttons, layouts, screens, and other UI elements are represented using widgets. This makes the UI reusable and organized.

  Q4 What is the difference between StatelessWidget and StatefulWidget?
  A4 StatelessWidget does not have changing internal state. Its UI depends on the values given to it.
     tatefulWidget can have changing state. When the state changes, its UI can be updated.

  Q5 What is BuildContext?
  A5 BuildContext represents the location of a widget inside the widget tree. It helps a widget access things such as theme, screen size, navigation, and other information around it.

  Q6 What is null safety?
  A6 Null safety is a feature in Dart that helps prevent errors caused by using null values where they are not expected.
     For example, `String? name` means that the variable can contain either a String or null.

  Q7 What is async/await?
  A7 `async` and `await` are used for tasks that take some time, such as getting data from an API.
     `async` makes a function asynchronous, while `await` waits for the result.

  Q8 What is a Future?
  A8 A Future represents a value that will be available sometime later.
     For example, when an app requests data from an API, the response may take some time, so the function can return a Future.
  
  Q9 What is state in a Flutter application?
  A9 State is the data or information that can change while the application is running.
     Examples include selected tabs, login status, loading status, and API data.

  Q10 Why is state management needed?
  A10 State management helps us store, update, and share application data in an organized way. It also prevents too much business logic from being placed inside UI widgets.

  Q11 What is Riverpod?
  A11 Riverpod is a state management solution for Flutter and Dart. It helps different parts of an application access and react to shared state.
  It also helps separate UI code from business logic and data handling.

  Q12 What is AsyncNotifier?
  A12 AsyncNotifier is a Riverpod class used to manage asynchronous state.
      It is useful when data can have three main states:
       Loading
       Data
      Error

  Q13 What is a repository?
  A13 A repository is a layer that handles access to data.
      The UI does not need to know whether the data comes from an API, database, or another source. The repository handles that part.

  Q14 What is a data source?
  A14 A data source is the actual place from which data is obtained.
      examples include an API, database, local storage, or another network service.

  Q15 Why should UI code not directly access an API?
  A15 UI code should mainly display the interface and handle user interaction.
      If UI directly handles API calls and business logic, the code becomes harder to maintain and test.
      The preferred flow is:
       UI → State/Controller → Repository → Data Source

  Q16 What is go_router?
  A16 go_router is a Flutter package used for navigation and routing.
      it supports routes, route parameters, query parameters, redirects, and authentication guards.
      Onyatrips uses go_router for navigation.

  Q17 What is an API?
  A17 API stands for Application Programming Interface.
      It allows different software systems to communicate with each other.
      For example:
       Flutter → API → Backend
 
  Q18 What is JSON?
  A18 JSON stands for JavaScript Object Notation. It is a common format used to exchange data between the frontend and backend.
      For example, a user's name and age can be sent as JSON data.

  Q19 What is HTTP?
  A19 HTTP stands for HyperText Transfer Protocol. It is used for communication between a client and a server.
      A Flutter application can use HTTP to send requests to the Onyatrips backend.

  Q20 What is REST?
  A20 REST is a common way of designing APIs using HTTP methods.
      GET is used to retrieve data.
      POST is used to create data.
      PUT or PATCH is used to update data.
      DELETE is used to delete data.

  Q21 What is Node.js?
  A21 Node.js is a runtime that allows JavaScript to run outside the browser.
      It is commonly used to build backend applications and APIs. Onyatrips uses Node.js for its backend.

  Q22 What is Express?
  A22 Express is a web framework for Node.js.
      It makes it easier to create APIs, handle HTTP requests, define routes, and send responses.
 
  Q23 What is Prisma?
  A23 Prisma is an ORM used with Node.js and TypeScript.
      It helps the backend communicate with the database using TypeScript code.

  Q24 What is PostgreSQL?
  A24 PostgreSQL is a relational database management system.
      It stores application data in tables containing rows and columns. Onyatrips uses PostgreSQL as its database.

  Q25 Why shouldn't Flutter connect directly to PostgreSQL?
  A25 Flutter should communicate with the backend API instead of connecting directly to the database.
      The correct flow is:
       Flutter → Express API → Prisma → PostgreSQL
       This keeps database access and business logic on the backend.

  Q26 What is the difference between frontend and backend?
  A26 Frontend is the part of the application that the user interacts with. Onyatrips uses Flutter for its frontend.
      Backend handles business logic, APIs, authentication, and database operations.
      onyatrips uses Node.js, Express, TypeScript, Prisma, and PostgreSQL for its backend.

  Q27 What is the difference between mock data and real API data?
  A27 Mock data is fake or sample data used during development.
      Real API data comes from the actual backend.
      Mock data is useful for building and testing the UI before the real API is ready.

  Q28 What is a primary key?
  A28 A primary key is a value that uniquely identifies each row in a database table.
      For example, a user's unique `id` can be the primary key.

  Q29 What is a foreign key?
  A29 A foreign key is a field that connects one table to another table.
      For example, a `user_id` in a Trips table can refer to the `id` of a user in the Users table.

  Q30 What is a database relationship?
  A30 A database relationship describes how tables are connected.
      The common types are one-to-one, one-to-many, and many-to-many relationships.

  Q31 What is an API error?
  A31 An API error happens when an API request cannot be completed successfully.
      Examples include invalid requests, authentication problems, missing data, and server errors.
      HTTP status codes such as 400, 401, 404, and 500 help describe these errors.

  Q32 What is a loading state?
  A32 A loading state means that the application is currently waiting for something to finish.
      For example, while traveller data is being fetched from an API, the app can show a loading indicator.

  Q33 What is an empty state?
  A33 An empty state appears when there is no data to display.
      For example:
        “No travellers found for these filters.”
         It tells the user why the screen is empty.
 
   Q34 What is an error state?
   A34 An error state appears when something goes wrong.
       For example, if an API request fails, the app can show:
        “Something went wrong. Please try again.”

   Q35 What is form validation?
   A35 Form validation checks whether the information entered by the user is correct before submitting it.
       For example, it can check whether an email is valid or whether a required field is empty.

   Q36 What is the purpose of filtering?
   A36 Filtering reduces a large number of results according to the user's requirements.
       In Onyatrips, users can filter travellers or trips using things such as dates, budget, transport, lifestyle, and traveller type.

   Q37 What is the difference between Groups and Individual Travellers in Onyatrips?
   A37 Groups are existing travel plans that a user can request to join.
       Individual Travellers are people that a user can discover and send a connection request to.
       Simple meaning:
       Group = “Can I join your trip?” 
       Individual = “Can we travel together?”

  Q38 What is the purpose of Add Myself?
   A38 Add Myself allows a traveller to make their profile available in the individual traveller discovery section.
       The user completes their profile and travel preferences so other travellers can discover them.
       For groups, the similar action is Create a Trip.

  Q39 What happens when a user connects with another traveller?
  A39 The user first sends a connection request.
      The other traveller can accept or reject it.
      If accepted, they can communicate through a one-to-one chat.
      The flow is: 
         Connect Request → Acceptance → Chat

  Q40 What is the difference between People and Places in Onyatrips?
  A40 People answers:
       “Who should I travel with?”
        It helps users discover groups and individual travellers.
        Places answers:
           “Where should I go?”
            It focuses on curated places, categories, filters, and place details.
            Simple meaning:
            People = Who
             places = Where
-----------------------------------------------------------------------------------------------------------------------------------------------