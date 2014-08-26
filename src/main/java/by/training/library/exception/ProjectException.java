package by.training.library.exception;

public class ProjectException extends Exception {

    private Exception hiddenException;

    public ProjectException(Exception e) {
        hiddenException = e;
    }

    public ProjectException(String msg) {
        super(msg);
    }

    public Exception getHiddenException() {
        return hiddenException;
    }

    @Override
    public String getMessage() {
        return hiddenException == null? super.getMessage() : hiddenException.getMessage();
    }

    @Override
    public void printStackTrace() {
        if (hiddenException == null) {
            super.printStackTrace();
        } else {
            hiddenException.printStackTrace();
        }
    }
}
