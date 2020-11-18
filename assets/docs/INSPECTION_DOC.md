Available Inspections
=======================
Following are the inspections available at the the moment.

## Style

### Indentation

Inspects for two spaces per indentation level (aka soft tabs).

~~~
# bad - four spaces
def some_method
    do_something
end

# good
def some_method
  do_something
end
~~~

### Spaces and Operators

Inspects for white spaces around operators, after commas, colons and semicolons.
Whitespace might be (mostly) irrelevant to the Ruby interpreter, but its proper use is the key to writing easily readable code.

~~~
# bad
sum=1+2
a,b=1,2
class FooError<StandardError;end

# good
sum = 1 + 2
a, b = 1, 2
class FooError < StandardError; end
~~~


### Snake Case for Symbols, Methods and Variables

Inspects snake_case naming for symbols, methods and variables.

~~~
# bad
:'some symbol'
:SomeSymbol
:someSymbol

someVar = 5

def someMethod
  # some code
end

def SomeMethod
  # some code
end

# good
:some_symbol

some_var = 5

def some_method
  # some code
end
~~~

### CamelCase for Classes

Inspects CamelCase naming for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase).

~~~
# bad
class Someclass
  # some code
end

class Some_Class
  # some code
end

class SomeXml
  # some code
end

class XmlSomething
  # some code
end

# good
class SomeClass
  # some code
end

class SomeXML
  # some code
end

class XMLSomething
  # some code
end
~~~

### Maximum Line Length
Inspects if lines are longer than 80 characters. 

### No Trailing Whitespace

Inspects for trailing white spaces. That means there should be no withspaces at the end of the line. 

## Complexity

### Method Length

Inspects for method length. Method length should not be more than 30 lines. 

