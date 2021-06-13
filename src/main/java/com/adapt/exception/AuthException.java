package com.adapt.exception;

class AuthException extends Exception {

    public AuthException(String message) {
        super(message);
    }

    public AuthException(Throwable cause) {
        super(cause);
    }

}
