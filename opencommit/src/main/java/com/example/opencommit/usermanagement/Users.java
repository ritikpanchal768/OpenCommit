package com.example.opencommit.usermanagement;

import com.example.opencommit.commonServices.CommonExtend;

import java.sql.Timestamp;

public class Users extends CommonExtend {

    private String fullName;
    private String username;
    private String email;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
