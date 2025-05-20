package com.example.roast.exceptions;

public class NoCoffeeFoundException extends RuntimeException{
    public NoCoffeeFoundException(){
        super("No Coffee Places Found");
    }
}
