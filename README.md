# Boris Bikes Challenge

### Development Goals
##### I can TDD anything
- Write effective tests, pertinent to the user requirements. 
- Write code driven to make the tests pass.
---
##### I can program fluently
- Setup and structure a new Ruby project effectively. 
- Turn user requirements into working code.
---
##### I can debug anything
- Effectively apply a consistent debugging process in order to uncover the root-cause of errors in the code, and resolve the issues.
---

### Challenge Outline
##### The focus of this challenge is to build a basic simulation of the London Boris Bikes infrastructure: 

- We want Bike **Docking Stations** where **Bikes** can be stored by docking them, or released to a user. 

- If there are not bikes available, the user will receive an error when trying to release a bike from the docing station.

- If the docking station is at maximum capacity, and the user tries to dock a bike, they will also receive an error.

- Further to this, we want the user to be able to flag bikes as broken, and make sure that our docking stations do not release broken bikes.

##### Additionally, we want to add in two more pieces of infrastructure: **Vans** and **Garages**: 

- **Vans** - Can collect and store broken bikes from **Docking Stations**, and deliver them to **Garages** (and vice versa).

- **Garages** - Can store bikes, **fix broken bikes**, and return bikes to **Vans**

##### Finally, in order to keep our code DRY, with greater readability and adaptability, we use a module in our code as a mixin: 

- Since **Docking Stations**, **Vans**, and **Garages** have a significant degree of overlap in their methods, we create a module called "BikeContainer" in order to hold these methods and clean up the code in each Class.
----

### Test Driven Development
Throughout this challenge, we used RSpec to create tests for our code as the first step at each point as we progressed through the work.

Tests written to ensure that we fulfill user requirements ensure that we stick to the required use cases, ensuring that our program can do everything that it should, without superfluous code.

Furthermore, it ensures that other programmers can see how our code works, without needing to run extensive testing themselves.

Finally, TDD provides a solid rational structure to the process of building a program, helping us to break down the requirements into logical chunks.

---
