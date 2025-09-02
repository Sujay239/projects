package org.spring.library.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionHandle {

    @ExceptionHandler
    public String exceptionHandle(Exception e,Model model){
        System.out.println(e.getMessage());
        model.addAttribute("ex",e.getMessage());
        return "error";
    }
}
