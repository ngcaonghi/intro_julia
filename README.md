# A short introductory guide to programming in Julia
Interested in Julia but don't know where to start (aside from Julia's Wikipedia entry [[1]](#1) and official website [[2]](#2))? This beginner-friendly repo might be of help!

## A project in Julia that I did

Some programmers prefer getting down to the nitty gritty of Julia by looking at a substantial Julia program. That's a legit ask! Here I present you a Julia project that, despite its size measured in lines of code, exemplifies most features that an average programmer might need to get acclimated to Julia routines right away. It's a tool to preprocess electroencephalogram (EEG) data (*i.e.*, brainwaves) by denoising, detecting bad channels, and fixing them. Find out more and try it via [this repo](https://github.com/ngcaonghi/prep-julia).

## History

Julia was developed by Jeff Bezanson, Stefan Karpinski, Viral B. Shah, and Alan Edelman with the goal of making a language, I guess, has the best features of popular languages like C, Ruby, Lisp, Matlab, Python, R and Perl—talking about free lunch for all! No, seriously, it's written in the first blog posted on Julia's official site titled "Why We Created Julia" [[3]](#3). But Julia is not meant to be a universal programming language: it was built with "scientific computing, machine learning, data mining, arge-scale linear algebra, \[and\] distributed and parallel computing" in mind [[3]](#3).

Since its development in 2009 [[4]](#4), Julia has been used for multiple purposes, the most popular of which are data science, visualization, machine learning, and scientific computing. Below are some of the most popular Jula projects on GitHub:

- Pluto *reactive* notebooks as an alternative to Jupyter notebooks ([fonsp/Pluto.jl](https://github.com/fonsp/Pluto.jl))
- DifferentialEquations.jl, a package for numerically solving differential equations ([SciML/DifferentialEquations.jl](https://github.com/SciML/DifferentialEquations.jl))
- Gadfly plotting and data visualization system ([GiovineItalia/Gadfly.jl](https://github.com/GiovineItalia/Gadfly.jl))
- MLJ toolbox for machine learning ([alan-turing-institute/MLJ.jl](https://github.com/alan-turing-institute/MLJ.jl))
- JuliaDB for parallel analytical database ([JuliaData/JuliaDB.jl](https://github.com/JuliaData/JuliaDB.jl))

## Getting started

### Installing Julia

The official Julia website has instructions for downloading and installing Julia on the platform you're using—take a look [**here**](https://julialang.org/downloads/platform/). But if you're using Linux, consider installing Julia through your distro's package manager (it will save you a few steps); just make sure the package you're installing is from the official repository.

If you're more of a visual learner, here are some usefull YouTube videos:

- (Windows) ["How to Install Julia language and Set up Path Environment Variable in Windows 10", Example Program](https://www.youtube.com/watch?v=ij8jF7_qriY)
- (macOS) ["How to install Julia and Jupyter notebooks", The Julia Programming Language](https://www.youtube.com/watch?v=oyx8M1yoboY&t=112s)
- (Linux) ["SDJ B1.0 | Appendix - Download and Install Julia in Linux(Debian)", MrDataPsycho](https://www.youtube.com/watch?v=7WSiObkBgh8)

### Setting up the programming environment

The official website suggests a few editors and IDEs, but the Julia community recommends Microsoft's VS Code because it has a lot of cool packages for all sorts of workflows in Julia [[5]](#5). Instructions to install VS Code and set up Julia on VS Code [**here**](https://code.visualstudio.com/docs/languages/julia#:~:text=Inside%20VS%20Code%2C%20go%20to,Restart%20VS%20Code.).

Did you know that you could run Julia in the Jupyter interactive environment (which is mostly used for workflows in data science and machine learning)? or that you could run IJulia notebooks in VS Code? Learn more and install the IJulia kernel [here](https://github.com/JuliaLang/IJulia.jl) if you're interested.

### Run your first program and command
When you're done installing Julia and setting up your programming environment, download any .jl in this repository and open it using your IDE. Then click run (or whatever buttons that compiles and runs the script; in VS Code, it's the little play button at the top right corner of the editor).

![Run Julia file by clicking the top right cornder of VS Code or type Ctrl F5](https://drive.google.com/uc?export=view&id=1sfU_Y9mNpkPAbqZAC9HHAekpFxjI9oIg)

If you want to try creating a new file and runs with your IDE, create a file named `helloWorld.jl`, open it and copy these lines into the editor:

```
"""
Doc-string, which is similar to Python. Your compiler will ignore this part.
"""
function helloworld()
    # comment, which is similar to Python. Your compiler will ignore this comment.
    print("Hello world!")
end

# run script
helloworld()
```

And if you're feeling adventurous and wanting to run a Julia command in the terminal, type `julia`, click enter, and type in, e.g., `print("Hello world!")`.

## Learning resources

Want to learn more about Julia beyond this repo? The official Julia website curated a pretty comprehensive list of learning resources, from books to MOOCs, and from data science to high-performance computing. Take a look [here](https://julialang.org/learning/ "Learning Julia")!

As this repo grows, I will also curate a list of learning materials that I find particularly useful and interesting. Stay tuned!


## References
<a id="1">[1]</a>
"Julia (programming language) - Wikipedia", En.wikipedia.org, 2022. [Online]. Available: https://en.wikipedia.org/wiki/Julia_(programming_language). [Accessed: 27- Feb- 2022].

<a id="2">[2]</a>
e. Jeff Bezanson, "The Julia Programming Language", Julialang.org, 2022. [Online]. Available: https://julialang.org. [Accessed: 27- Feb- 2022].

<a id="3">[3]</a> 
e. Jeff Bezanson, "Why We Created Julia", Julialang.org, 2022. [Online]. Available: https://julialang.org/blog/2012/02/why-we-created-julia/. [Accessed: 27- Feb- 2022].

<a id="4">[4]</a> 
S. D'Cunha, "How A New Programming Language Created By Four Scientists Now Used By The World's Biggest Companies", Forbes, 2022. [Online]. Available: https://www.forbes.com/sites/suparnadutt/2017/09/20/this-startup-created-a-new-programming-language-now-used-by-the-worlds-biggest-companies/?sh=39661ad77de2. [Accessed: 27- Feb- 2022].

<a id = "5">[5]</a>
"IDE for Julia", JuliaLang, 2022. [Online]. Available: https://discourse.julialang.org/t/ide-for-julia/61931/6. [Accessed: 27- Feb- 2022].
