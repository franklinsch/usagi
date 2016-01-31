package com.example.usagi;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Form Handling Servlet
 * Most of the action for this sample is in webapp/guestbook.jsp, which displays the
 * {@link Greeting}'s. This servlet has one method
 * {@link #doPost(<#HttpServletRequest req#>, <#HttpServletResponse resp#>)} which takes the form
 * data and saves it.
 */
public class UsagiServlet extends HttpServlet {

  // Process the http POST of the form
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    //UserService userService = UserServiceFactory.getUserService();
    //User user = userService.getCurrentUser();  // Find out who the user is.

    String projectName = req.getParameter("projectName");
    String hack = req.getParameter("hack");

    if (hack.equals("addTask")) {
      String activityName = req.getParameter("activityName");
      Long duration = Long.parseLong(req.getParameter("duration"));
      //if (user != null) {
      //} else {
      //}
      Activity newActivity = new Activity(activityName, duration);
    } else if (hack.equals("createProject")) {
      Project newProject = new Project(projectName);
      newProject.save();
    }
    resp.sendRedirect("/usagi.jsp?projectName="+projectName);
  }
}
