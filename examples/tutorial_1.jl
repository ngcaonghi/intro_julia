# The code here is copied from the Jupyter file `Tut1_NamesType.ipynb`.
# Run this file if you have trouble with the Jupyter notebook.
# If you're using VS Code (which is highly recommended), press Ctrl F5 to run.

# ==============================================================================
# Section 1:
# NAMING

# Examples of variable names that are legal but unconventional and/or ugly:
😅yikes😅 = "yikes"
xₐ = "xa"

# Examples of variable and constant names that are legal and conventional:
x = 2
xa = 2
x_other = 2
X_CONSTANT = 2

# ==============================================================================
# Section 2:
# TYPES

println("Section 2:\n")

integer_d = 3
unsigned_d = 0x123456789abcdef
float_d = 3.5
char_d = '3'
string_d = "three"
boolean_d = true
array_d = [1, 2, 3]
dictionary_d = Dict("one" => 1, "two" => 2, "three" => 3)

println("\nExample of DYNAMIC typing:\n")
println("Type of `integer_d`: ", typeof(integer_d))
println("Type of `unsigned_d`: ", typeof(unsigned_d))
println("Type of `floating_d`: ", typeof(float_d))
println("Type of `char_d`: ", typeof(char_d))
println("Type of `string_d`: ", typeof(string_d))
println("Type of `boolean_d`: ", typeof(boolean_d))
println("Type of `array_d`: ", typeof(array_d))
println("Type of `dictionary_d`: ", typeof(dictionary_d))

let 
    integer_s::Int = 3 
    unsigned_s::UInt = 0x123456789abcdef
    float_s::AbstractFloat = 3.5
    char_s::Char = '3'
    string_s::String = "three"
    boolean_s::Bool = true
    array_s::Array = [1, 2, 3]
    dictionary_s::Dict = Dict("one" => 1, "two" => 2, "three" => 3)

    println("\nExample of STATIC typing:\n")
    println("Type of `integer_s`: ", typeof(integer_s))
    println("Type of `unsigned_s`: ", typeof(unsigned_s))
    println("Type of `float_s`: ", typeof(float_s))
    println("Type of `char_s`: ", typeof(char_s))
    println("Type of `string_s`: ", typeof(string_s))
    println("Type of `boolean_s`: ", typeof(boolean_s))
    println("Type of `array_s`: ", typeof(array_s))
    println("Type of `dictionary_s`: ", typeof(dictionary_s))
end

import Pkg; Pkg.add("BenchmarkTools")
using BenchmarkTools

function loop_init_float_dynamic()
    for i in 0:10^10 x = 3.5 end
end

function loop_init_abstract_float()
    for i in 0:10^10 x::AbstractFloat = 3.5 end
end

function loop_init_float32()
    for i in 0:10^10 x::Float32 = 3.5 end
end

function loop_init_float64()
    for i in 0:10^10 x::Float64 = 3.5 end
end

println("\nDemonstration that static typing does not always result in performance gain\n")
@btime loop_init_float_dynamic()
@btime loop_init_abstract_float()
@btime loop_init_float32()
@btime loop_init_float64()

println("\nPrimitive types and their ancestor, abstract types\n")
function typetraverse(x)
    sub = typeof(x)
    super = supertype(sub)
    print(sub)
    while sub != super 
        print(" -> ", super)
        sub = super 
        super = supertype(sub)
    end
end

examples = [integer_d, unsigned_d, float_d, char_d, string_d, boolean_d, 
            array_d, dictionary_d]

for e in examples
    print("Traverse `$e`: \t")
    typetraverse(e)
    println()
end

let 
    println("\nImplicit conversion\n")
    x::Char = '2'
    y::Int64 = 5
    z = x+y
    println("Type of z is ", typeof(z))
    println("z = ", z)

    println("\nImplicit, widening conversion\n")
    a::Float64 = 3.5
    b::Int64 = 2
    c = a + b
    println("Type of c is ", typeof(c))
    println("c = ", c)
end

let
    println("\nMutable struct\n")
    mutable struct MutableCoordinate
        x::Real
        y::Real
    end
    
    m = MutableCoordinate(0, 0.5)
    m.x = 3.0
    println("m.x after changing: ", m.x)
end