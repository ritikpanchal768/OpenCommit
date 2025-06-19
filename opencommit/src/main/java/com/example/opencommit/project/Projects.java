package com.example.opencommit.project;

import com.example.opencommit.commonServices.CommonExtend;

public class Projects extends CommonExtend {

    private String title;
    private String description;
    private String ownerid;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOwnerid() {
        return ownerid;
    }

    public void setOwnerid(String ownerid) {
        this.ownerid = ownerid;
    }

}
