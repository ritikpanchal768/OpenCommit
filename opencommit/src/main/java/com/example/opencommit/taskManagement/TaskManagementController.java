package com.example.opencommit.taskManagement;

import com.example.opencommit.commonServices.CommonResponse;
import com.example.opencommit.project.ProjectHelper;
import com.example.opencommit.project.ProjectRequest;
import com.example.opencommit.project.Projects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/taskManagement")
public class TaskManagementController {
    private static final Logger logger = LoggerFactory.getLogger(TaskManagementController.class);
    @PostMapping("/create/task")
    public CommonResponse<Tasks> addExpense(@RequestBody TasksRequest request) throws Exception {
        logger.info("************* Inside Add project Controller ****************");

        CommonResponse<Tasks> commonResponse;
        try {
            commonResponse = new TaskManagementHelper().addTask(request);
        } catch (Exception e) {
            throw new Exception(e);
        }
        return commonResponse;
    }
    @GetMapping("/view/{projectId}")
    public CommonResponse<List<Tasks>> viewbyusername(@PathVariable String projectId)throws Exception{
        CommonResponse<List<Tasks>> commonResponse;
        try {
            commonResponse = new TaskManagementHelper().viewbyusername(projectId);
        } catch (Exception e) {
            throw new Exception(e);
        }
        return commonResponse;
    }
}
