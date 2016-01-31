package com.example.usagi;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.Ref;

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
public class SubProject {
  @Id public Long id;

  public boolean calculatedSinceLastUpdate;

  public String name;
  public Ref<Milestone> start;
  public Ref<Milestone> end;

  public SubProject() {}
  public SubProject(String name) {
    Milestone start = new Milestone();
    start.save();

    this.start = Ref.create(start);
    this.end = this.start;
    this.name = name;
  }

  public void save() {
    ObjectifyService.ofy().save().entity(this).now();
  }

  public Long calculateLongestPath(Milestone start, 
                                   List<Activity> activityPath) {
    if (calculatedSinceLastUpdate) {
      return end.get().timeSinceStart;
    }

    if (start == end.get()) {
      calculatedSinceLastUpdate = true;
      return new Long(0);
    }

    Long max = new Long(0);
    List<Activity> activityPathBase = new ArrayList<Activity>(activityPath);

    for (Activity activity: start.nextActivities) {
      Milestone dest = activity.destination.get();
      dest.timeSinceStart = Math.max(dest.timeSinceStart, activity.duration + start.timeSinceStart);
      List<Activity> activityPathClone = new ArrayList<Activity>(activityPathBase);
      Long pathLength = calculateLongestPath(dest, activityPathClone) + activity.duration;
      if (pathLength > max) {
        max = pathLength;
        activityPath = activityPathClone;
        activityPath.add(0, activity);
      }
    }
    
    return max;
  }
}
