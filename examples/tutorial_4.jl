# The code here is copied from the Jupyter file `Tut4_StructTypes.ipynb`.
# Run this file if you have trouble with the Jupyter notebook.
# If you're using VS Code (which is highly recommended), press Ctrl F5 to run.

struct Singleton
    x
end

# construct Singleton
a = Singleton('a')
b = Singleton(1)
println("a: ", a, ", b: ", b)

let
    struct DataScienceStudent
        name::AbstractString
        id::Int
        concentration::AbstractString
        transcript::Dict{AbstractString, AbstractString}
        advisor::AbstractString
        standing::AbstractString
    end

    nigel = DataScienceStudent("Nigel", # name
                               01, # id 
                               "Machine Learning", # concentration
                               Dict("Linear Algebra" => "A"), # transcript
                               "Dr. Alpha Waymond", # advisor
                               "good") # standing
    println("nigel's struct: ", nigel)
end

let
    struct SoftwareStudent
        name::AbstractString
        id::Int
        concentration::AbstractString
        transcript::Dict{AbstractString, AbstractString}
        advisor::AbstractString
        standing::AbstractString
    end
    
    # external constructor
    function SoftwareStudent(; name, id, concentration, 
                               transcript=Dict{AbstractString, AbstractString}())
        # name, id, concentration, and transcript are now passed as 
        # keywords args.
        # transcript is assigned to an empty Dict by default.
        # other fields are automatically filled in.
        SoftwareStudent(name, id, concentration, transcript, "Dr. Alpha Evelyn", "good")
    end

    nicole = SoftwareStudent(id=02, name="Nicole", concentration="Game Design")
    println("nicole's struct: ", nicole)
end

abstract type Student end
abstract type ClassOf23 <: Student end # ClassOf23 is a subtype of Student
abstract type CS23 <: ClassOf23 end # CS23 is a subtype of ClassOf23
abstract type Art23 <: ClassOf23 end # Art23 is a subtype of ClassOf23

# Concrete types that inherit CS23

struct DataScienceStudent <: CS23
    name::AbstractString
    id::Int
    concentration::AbstractString
    transcript::Dict{AbstractString, AbstractString}
    advisor::AbstractString
    standing::AbstractString
end

struct SoftwareStudent <: CS23
    name::AbstractString
    id::Int
    concentration::AbstractString
    transcript::Dict{AbstractString, AbstractString}
    advisor::AbstractString
    standing::AbstractString
end

function SoftwareStudent(; name, id, concentration, 
    transcript=Dict{AbstractString,AbstractString}())
SoftwareStudent(name, id, concentration, transcript, "Dr. Alpha Evelyn", "good")
end

# ==============================================================================

# Concrete type that inherits Art23

struct FineArtStudent <: Art23
    name::AbstractString
    id::Int
    concentration::AbstractString
    transcript::Dict{AbstractString, AbstractString}
    advisor::AbstractString
    standing::AbstractString
end

function FineArtStudent(; name, id, concentration, 
    transcript=Dict{AbstractString,AbstractString}())
FineArtStudent(name, id, concentration, transcript, "Dr. Alpha Gong Gong", "good")
end

# ==============================================================================
# A function whose method is defined for inputs that are subtypes of `Art23`
# and `CS23`:

function dorm_building(; artstudent::Art23, csstudent::CS23)
    if (typeof(artstudent) == FineArtStudent 
    && typeof(csstudent) == DataScienceStudent)
        return "Building A"
    end
    return "Building B"
end

# =============================================================================
# Demo:

nicole = SoftwareStudent(name="Nicole", id=02, concentration="Game Design")
natasha = FineArtStudent(name="Natasha", id=04, concentration="Sculpture")
dorm_building(artstudent=natasha, csstudent=nicole)

let
    abstract type Buddy{Student} end # `Buddy` now takes `Student` as a parameter

    # by declaring CrossConcentrationBuddy{Student}, 
    # CrossConcentrationBuddy{ClassOf23} and CrossConcentrationBuddy{CS23} 
    # can now be declared using the same constructor.
    struct CrossConcentrationBuddy{Student} <: Buddy{Student}
        stuA::Student 
        stuB::Student
    end

    nigel = DataScienceStudent("Nigel",
                               01,
                               "Machine Learning",
                               Dict("Linear Algebra" => "A"),
                               "Dr. Alpha Waymond",
                               "good")

    nicole = SoftwareStudent(id=02, name="Nicole", concentration="Game Design")

    buddies = CrossConcentrationBuddy{ClassOf23}(nigel, nicole) 
    # see the `ClassOf23`?
    
    println(buddies)
end 

let
    abstract type Buddy{Student} end
    struct CrossConcentrationBuddy{Student} <: Buddy{Student}
        stuA::Student
        stuB::Student
    
        # inner constructors are used whenever there needs to be a restriction
        # on what arguments are allowed to passed in.
        function CrossConcentrationBuddy{Student}(stuA, stuB)
            if stuA.concentration == stuB.concentration
                throw(ArgumentError("Students must have different concentrations!"))
            end
            new(stuA, stuB)
        end
    end
    
    nicole = SoftwareStudent(id=02, name="Nicole", concentration="Game Design")
    natalie = SoftwareStudent(id=03, name="Nicole", concentration="Game Design")
    
    # this pair cannot be formed because the 2 students share a concentration
    buddies_2 = CrossConcentrationBuddy{Student}(natalie, nicole)
    println(buddies_2)
    
end