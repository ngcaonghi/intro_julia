# The code here is copied from the Jupyter file `Tut2_SelectionControl.ipynb`.
# Run this file if you have trouble with the Jupyter notebook.
# If you're using VS Code (which is highly recommended), press Ctrl F5 to run.

function compare(x, y)
    if x < y
        println(x, " < ", y)
    elseif x > y
        println(x, " > ", y)
    else
        println(x, " = ", y)
    end
end

compare(1, 2)

function isdigit(x::Int)
    if 0 <= x <= 9
        println(x, " is a digit")
    else
        println(x, " is not a digit")
    end
end

isdigit(9)
isdigit(9.5)
isdigit(10)

function alwaystrue()
    return true
end

if alwaystrue()
    println("this code is legal.")
else
    println("the condition is always satisfied, so this line will not be printed.")
end

if convert(Bool, 1)
    println("this code is legal because 1 has been converted to boolean `true`.")
end

function shortcircuitdemo()

    # define trueprint() method 
    function trueprint()
        println("If this line is printed after a `true || trueprint()` or a ",
                "`false && trueprint()` statement, there is NO short circuiting.",
                "Fortunately, this is not printed because we're using ",
                "short circuiting")
        return true
    end

    # check if shortcircuiting happens. If trueprint() prints out the statement
    # above, then NO shortcircuiting happened; otherwise, it did.
    if (true || trueprint())
        println("whole statement is true")
    end
    if (false && trueprint())
        # pass, i.e. do nothing
    else
        println("whole statement is false")
    end
end

shortcircuitdemo()

f = (x::Real) -> 
x > 0 ? println(string(x)*" is positive") : println(string(x)*" is non-positive")
f(1.0)
f(-1.0)

array = [1 2 3 4 5 6 7 8]
even_mask = [x % 2 == 0 ? true : false for x = array]
println(even_mask)