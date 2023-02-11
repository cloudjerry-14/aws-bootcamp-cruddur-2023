# Week 0 — Billing and Architecture

Architectures :
1. Monolithic Architecture : A monolithic architecture is a singular, large computing network with one code base that couples all of the business concerns together.
                            
                          Refer the below diagram to understand monolithic architecture of a Shopping Application with Inventory, UI, and Payment services all bundled together.
 

<img width="374" alt="image" src="https://user-images.githubusercontent.com/71233890/218277610-ea438664-d204-4e02-8107-02c9007d92c0.png">

2. Microservices Architecture : A microservice is an architectural method that relies on a series of independently deployable services. These services have their own business logic and database with a specific goal. Updating, testing, deployment, and scaling occur within each service. Microservices decouple major business, domain-specific concerns into separate, independent code bases.

                      Refer the below diagram to understand microservice architecture of a Shopping Application with Inventory, UI, and Payment services which decouple all major business, domain-specific concerns into separate, independent code bases which function independently of each other and contribute to the overall whole app.

<img width="453" alt="image" src="https://user-images.githubusercontent.com/71233890/218277568-ccc53a00-6b58-4039-a412-fc58e8e471ce.png">

-------------------------------------------------------------------------

Designing CRUDDUR App : Ephermal-first micro blogging platform

Requirements : Create a highly availble and scalable micro blogging platform with features including as below:
1. login/register
2. CRUDD post
3. Direct messaging
4. Auto delete CRUDD post after selected expiry time

Napkin design 

<img width="710" alt="image" src="https://user-images.githubusercontent.com/71233890/218280148-6ad0c6bf-b7cd-4868-bf52-e99d6a981670.png">




Designing CICD pipeline for Cat App:

<img width="617" alt="image" src="https://user-images.githubusercontent.com/71233890/218280242-bee7a04a-3be4-40cc-8c71-04c21f6c2e9d.png">





