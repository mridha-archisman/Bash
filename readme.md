# Bash Scripting

## Script Execution

In your terminal, to know in which location bash/ zsh is installes, enter the command :line

```zsh

    which zsh
```

In the beginning of all shell scripts, use this line :

```zsh

    #! <path to directory in which zsh is installed>

    # for example
    #! /usr/bin/zsh
```

To execute the shell script, naviagte to the folder in your terminal and write :

```zsh

    chmod +x ./<filename>

    # for example
    chmod +x ./script.zsh
```

## Variables and Comments

Comments can be written like this :

```zsh

    # This is a comment
```

There can be 2 types of variables in a shell script. User defined and Globally available variables. For example $ZSH is a globally available variable storing the path where zsh is installed. Globally available variables are always in uppercase and user defined variables are in lowercase conventionally. Variables are always written with a $ sign ion the beginning. Some Globally available variables are :

ZSH_VERSION -> stores the zsh zsh version
HOME -> stores the home directory path
PWD -> stores the current working directory

For example :

```zsh

    echo $PWD
```

User defined vriables example :

```zsh

    name=archisman # don't use any whitespace
    echo My name is $name
```

## User input

We can use the read keyword, to read user input from the terminal and store it in a variables. For example :

```zsh

    echo "What is your name ?"
    read name
    echo "Ok ! you are $name"
```

We can take multiple user inputs in this manner :

```zsh

    echo "Enter 3 random numbers"
    read num1 num2 num3
    echo "You entered: $num1 , $num2 , $num3"
```

We can take input in the same line in this manner :

```zsh

    read -p "username: " name
    echo "Welcome $name"
```

In case of taking passwords as input, we don't want to show what the user is typing. Then we pass the -sp flag. s stands for silent.

```zsh

    read -p "password" password
```

To take multiple inputs from the user in the form of an array, we use the -a flag :

```zsh

    echo "Enter some numbers"
    read -a numbers

    # Input the array elements
    echo "You enetered ${ numbers[0] }"
```

We can also use the $REPLY global variable, instead of making a variable in this manner :

```zsh

    echo "What is your name ?"
    read
    echo "Ok ! you are $REPLY"
```

## Arguments

Arguments passed are taken as arrays.

```zsh

    args = ("$@");
```

To print an argument stored at an index of the array, we write this command :

```zsh

    echo ${ args[0] }
```

To print all the arguments at the same time :

```zsh

    echo $@
```

To prin the number of arguments taken in the input :

```zsh

    echo $#
```

## If else statement :

```zsh

    count=10

    if [ "$count" > "10" ]
    then
        echo "If Block"
    elif [ "$count" < "10" ]
    then
        echo "Else if Block"
    else
        echo "Else Block"
    fi
```

## File check operations

The -e flag checks whether the file is existing or not.

```zsh

    read -p "Enter file name : " name

    if [ -e "$name" ]
    then
        echo "File found"
    else
        echo "File not found"
    fi
``` 

If we want to check whether the argument passed, is a file or not, we can use -f flag. To check whether a file has write permission or not, we use the -w flag.

To check whether a directory exists or not, we can use the -d flag.

## Logical Operators

The logical and operator is written in this manner :

```zsh

    count=10

    if [ "$count" > "9" ] && [ "$count" == "10" ]
    then
        echo "Condition satisfied"
    fi
```

The logical operator is written in the same manner. The operator is '||'

## Perform Mathematical Operations

```zsh

    num1=10
    num2=15

    echo $(( num1+num2 ))
```

If we go for complex mathematical operations like square root and floating point operations, we write like this :

```zsh

    echo "20.5+5" | bc
    echo "sqrt($num)" | bc -l
```

The | operator acts such that the result of the mathematical operation acts as input for the bc variable. Then the bc variable is printed. For square root or exponentiation operations, we need to use the math library, and for that we use the -l flag.

## The case statement

```zsh

    args=("$@")

    case ${ args[0] } in
        "car" )
            echo "You typed car" ;;
        "van" )
            echo "You typed van" ;;
        "truck" )
            echo "You typed truck" ;;
        * )
            echo "Unknown input" ;;
    esac
```

## Arrays

```zsh

    os=('ubuntu' 'windows' 'kali')

    echo ${ os[0] }
```

To remove an element from the array :

```zsh

    unset os[2]
```

To add an element to the array :

```zsh

    os[3] = 'mac'
```

We can print all the elements of the array, or know the length of the array in this manner :

```zsh

    echo "${ os[@] } ${ #os[0] }"
```

## Loops

* While loops

```zsh

    n=3

    while [ "$n" < 3 ]
    do
        echo $n
        n=$(( n+1 ))

        # We can also use n=$(( n++ )) syntax 
    done
```

We can read a file using the while loop, in the following way :

```zsh

    while read p
    do
        echo $p
    done > output.txt
```

Bash also provides us with the until loop. Until loop executes the conditional block, until the condition is true.

```zsh

    num=1

    until [ "$num" > "5" ]
    do
        echo $num
        num=(( $num++ ))
    done
```

For loops :

```zsh

    for i in 1 2 3 4 5
    do
        echo $i
    done
```

We can provide the range of i using the '..' operator. After that, we can again use the '..' operator and mention the increment value of i, per loop.

```zsh

    for i in {1..10..2}
    do
        echo $i
    done
```

We have the select loop, which prints lists in menu format. It also has casing support.

```zsh

    select name in "John" "Mark"
    do
        case $name in
            "Mark" )
                echo $name ;;
        * )
            echo "John"
    done
```

## Breaks and Continues

```zsh

    for i in {1..10..1}
    do
        if [ "$i" > "3" && "$i" < "5" ]
        then
            continue
        else if [ "i" > "7" ]
            break
        else
            echo "$i"
        fi
    done
```

## Functions

```zsh

    function printHello(){

        echo "Hello"
    }

    ## Execute the function
    printHello
```

We can pass arguments to the function in this manner :

```zsh

    function name(){
        name=$1

        echo "$name"
    }

    name "Max"
```

By $1 we mean to access the 1st argument. If we want to access the nth argument, we will write '$<n>'.

We can create local variables in this manner :

```zsh

    function name(){

        local name=$1
        echo "Local Variable - $name"
    }

    name="Max"

    name "Archisman"
    echo "Global variable - $name"
```

## Readonly variables and functions

```zsh

    name=5
    readonly name

    function printHey(){

        echo "Hey"
    }

    readonly printHello
```

Now the variable name and the function printHey are both unchangeable. We can check the list of readonly variables and functions using these commands :

```zsh

    readonly -p
    readonly -f
```

## Signal and trap

If during the execution of our shell script, any exit signal is received, we can trap and kill it and print a message for that, without stopping our script from executing.

```zsh

    trap "Exit Signal detected" SIGKILL
```

## Redirection

There are 3 types of redirection. Input, Output and Error. They are represented by 0, 1 and 2. To redirect ouput logs into some file, we write command in this format :

```zsh

    echo hello <number>> <filename>
```

Suppose we type in this command :

```zsh

    echo hello > output.txt
```

This is called output redirection. The output log of the command 'echo hello' will be redirected to the output.txt file. Then we view the file using the command 'cat output.txt'.

We can output error logs into a file in this manner :

```zsh

    echo hello 2> output.txt
```

If we want to perform multiple redirection operations, with all the outputs in the same file, we use this syntax :

```zsh

    ls . documents >output.txt 2>&1

    # This syntax will be considered wrong and not redirect the second category of logs !
    ls . documents >output.txt
```

For output redirection, if the file pre-exists, then the contents of the file are overriden. If we want to append to the contents to the file, we use the '>>' operatpor instead of '>'.

## AWK Commands

## SED Commands

## GREP Commands

## Scheduling jobs

## tree views