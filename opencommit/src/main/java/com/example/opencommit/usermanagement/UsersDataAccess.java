package com.example.opencommit.usermanagement;

import com.example.opencommit.commonServices.DbUtils;

public class UsersDataAccess {

    public Users getByUsername(String username) throws Exception{
        String query = "Select * From users where username = ?";
        return new DbUtils().returnedAsObject(query,Users.class,username);
    }
}
