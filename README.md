# The Chain Of Responsibility
The Chain of Responsibility allows passing requests along a chain of handlers, where each handler decides to process or pass the request.

* Decouples the request sender from receivers
* The receivers form a chain
* The request travels along this chain

## Purpose
* Promotes loose coupling between the sender and receivers


## How it works
* Create and set up the chain
    - Pass requests to the root of the chain
    - Processing happens automatically, with no sender interaction

## Benefits
* Provides flexibility in handling various requests by different handlers
    - Sender not tied to concrete handlers
    - Sender unaffected by handlers or chain content changes
* Useful when multiple objects can handle a request
* Enables issuing a request to several objects without specifying the receiver explicitly.
    
    
## Pitfalls
* Not suitable when each request is handled by only on responder
* Inefficient with a limited number of request handlers
* Potential performance issues with long handler chains
* Debugging can be difficult due to distributed request handling
* No guarantee a request will be handled
* Potential performances issues
* Increased difficulty in debugging and maintenance.



