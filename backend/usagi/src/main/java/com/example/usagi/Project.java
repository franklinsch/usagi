package com.example.usagi;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.Key;

import java.lang.String;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import com.googlecode.objectify.ObjectifyService;

/**
 * The @Entity tells Objectify about our entity.  We also register it in {@link OfyHelper}
 * Our primary key @Id is set automatically by the Google Datastore for us.
 *
 * We add a @Parent to tell the object about its ancestor. We are doing this to support many
 * guestbooks.  Objectify, unlike the AppEngine library requires that you specify the fields you
 * want to index using @Index.  Only indexing the fields you need can lead to substantial gains in
 * performance -- though if not indexing your data from the start will require indexing it later.
 *
 * NOTE - all the properties are PUBLIC so that can keep the code simple.
 **/
@Entity
public class Project {
  @Id public Long id;

  public String name;
  public Milestone start;
  public Milestone end;

  public Project() {}
  public Project(String name) {
    this.name = name;
    this.start = new Milestone(name);
    //this.end = this.start;
    System.out.println("Init values for project");
  }

  public void save() {
    System.out.println("About to save project");
    ObjectifyService.ofy().save().entity(this).now();
    System.out.println("Saved project");
  }

  public void addActivity(String activityName, Long duration, List<Activity> dependencies) {
    Activity newActivity = new Activity(name, activityName, duration);
    for (Activity activity: dependencies) {
      activity.destination.nextActivities.add(newActivity);
    }
  }

  public Long calculateLongestPath(Milestone start, 
                                   List<Activity> activityPath) {
    if (start == end) {
      return new Long(0);
    }

    Long max = new Long(0);
    List<Activity> activityPathClone = new ArrayList<Activity>(activityPath);

    for (Activity activity: start.nextActivities) {
      Long pathLength = calculateLongestPath(activity.destination,
                                             activityPath);
      if (pathLength > max) {
        max = pathLength;
      } else {
        activityPath = activityPathClone;
      }
    }

    return max;
  }
}
