<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Queue" %>
<%@ page import="java.util.ArrayDeque" %>
<%@ page import="com.example.usagi.Project" %>
<%@ page import="com.example.usagi.Milestone" %>
<%@ page import="com.example.usagi.Activity" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<%
    String projectName = request.getParameter("projectName");
    if (projectName == null) {
      projectName = "default";
    } else {
      Project project = ObjectifyService.ofy()
        .load()
        .type(Project.class)
        .filter("name", projectName)
        .first()
        .now();

      if (project != null) {
        Queue<Milestone> queue = new ArrayDeque<Milestone>();
        queue.add(project.start.get());
        while (queue.size() != 0) {
          Milestone milestone = queue.remove();
          pageContext.setAttribute("source", milestone);
          for (Activity activity: milestone.nextActivities) {
            pageContext.setAttribute("activity", activity);
%>
<p>${fn:escapeXml(source)} ${fn:escapeXml(activity)} ${fn:escapeXml(activity.destination)}<\p>
<%
            queue.add(activity.destination.get());
          }
        }
      }
    }
    pageContext.setAttribute("projectName", projectName);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
        pageContext.setAttribute("user", user);
%>

<p>Hello, ${fn:escapeXml(user.nickname)}! (You can
    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
} else {
%>
<p>Hello!
    <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
    to include your name with greetings you post.</p>
<%
    }

    Key<Project> theProject = Key.create(Project.class, projectName);

    List<Milestone> milestones = ObjectifyService.ofy()
          .load()
          .type(Milestone.class)
          .ancestor(theProject)
          .limit(1)           
          .list();
    int size = milestones.size();
%>

<form action="/usagi" method="post">
    <div><input type="text" name="projectName" placeholder="Project Name"></div>
    <div><input type="text" name="activityName" placeholder="Activity Name"></div>
    <div><input type="text" name="duration" placeholder="Duration"></div>
    <div><input type="submit" value="Add Task"/></div>
    <input type="hidden" name="project" value="${fn:escapeXml(project)}"/>
    <input type="hidden" name="hack" value="addTask"/>
</form>
<form action="/usagi" method="post">
    <div><input type="text" name="projectName" placeholder="Project Name"></div>
    <div><input type="submit" value="Create Project"/></div>
    <input type="hidden" name="hack" value="createProject"/>
</form>
<form action="/usagi.jsp" method="get">
    <div><input type="text" name="projectName"/></div>
    <div><input type="submit" value="Get Project"/></div>
</form>

</body>
</html>
