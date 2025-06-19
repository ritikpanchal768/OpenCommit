package com.example.opencommit.project;

import com.example.opencommit.commonServices.CommonResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/projects")
public class ProjectController {

    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    @PostMapping("/create/project")
    public CommonResponse<Projects> addExpense(@RequestBody ProjectRequest request) throws Exception {
        logger.info("************* Inside Add Expense Controller ****************");

        CommonResponse<Projects> commonResponse;
        try {
            commonResponse = new ProjectHelper().addProjectRequest(request);
        } catch (Exception e) {
            throw new Exception(e);
        }
        return commonResponse;
    }
}
