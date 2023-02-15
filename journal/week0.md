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

           Napkin diagram for CICD of 
 
 
<img width="532" alt="image" src="https://user-images.githubusercontent.com/71233890/218280561-b7eb1c22-b468-4981-8a10-2f642083962f.png">

           Logical diagram for CICD 

 Link to the diagram : https://lucid.app/lucidchart/12527a1b-50f1-44f8-870e-dd41e91d4b52/edit?viewport_loc=-355%2C462%2C2048%2C862%2CA-jw~WsuqJQx&invitationId=inv_ec33f434-40aa-49ab-8f60-2df6ef9ece0b

<img width="617" alt="image" src="https://user-images.githubusercontent.com/71233890/218280242-bee7a04a-3be4-40cc-8c71-04c21f6c2e9d.png">





Tasks Tracker :

1. Create an IAM User and generated the credentials.
2. Added MFA for the IAM user.
3. Created a spend budget on AWS.
4. Created a billing alarm for my spend budget on aws.
5. Created napking design and logical design diagrams
6. Played around the AWS console



