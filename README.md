# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary:First,we parsed through the instructions and encoded them using the convention followed in Hennessy and Patterson's book on 
Computer Architecture.For this we created our own assembler in C++ and in this assembler we also wrote code to detct any dependencies
and consequently the data and control hazards were identified in the assembler itself. While encoding please note that we encoded the 
offset along with branch and jump instructions instead of names like "loop" or "label1".
                                                  Then we designed a module in Cpp named Implementation.cpp in which we used the Concept
of OOPs and OOAD to decompose our code and then abstracted it with methods and used our methods to call and executed the 5 stages.We created 
classes for each of Decode,Execute,Data Memory,Write Back Unit. We solved both data and control hazards using Stalling. For every branch 
encountered we stopped the pipeline for 3 cycles. We also tried to implement in verilog and created individual modules for the units.
We also tested individual modules against testbench. We put in our sincere efforts for this project.
As is the case with every team project we managed our time and were there for each other when the other was ill or was low in self confidence.
Infact one of our team members was engaged in Thomso fest and was consequently practising for 9-10 hours a day and we saw to it that we explained 
our code to him and He put in his efforts to complete his part of code.

### Contribution guidelines ###

* Writing tests: The testbecnhes were majorly written by Pasala Veerasiva(21114070) and Akula Koushik(21114010).
* Code review:We all reviewed the code and debugged it through our consistent efforts.

* Assembler: Ramavath Lalu(21114080) and Cheedu Praneeth Reddy(21114031)

* File Handling by Cheedu Praneeth Reddy(21114031)

* C++ Code:Velavali Venkata Karthikeya Sai Vydhik(21114110) and Uppala Vivek Narayan(21114108)

* Verilog Code:We all individually split modules and consequently after completion of those modules sat through 2 entire days and Integrated
the modules through designing a main module.

### Who do I talk to? ###

* You can contact us through our mail (akulakoushik789@gmail.com) or (viveknarayan.u@gmail.com)