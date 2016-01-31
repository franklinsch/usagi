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
public class Project {
  @Id public Long id;

  @Index public String name;
  public List<Ref<SubProject>> subProjects;

  public Project() {}
  public Project(String name) {
    SubProject subProject = new SubProject(name);
    subProject.save();

    subProjects = new ArrayList<Ref<SubProject>>();  
    subProjects.add(Ref.create(subProject));
    this.name = name;
  }

  public void save() {
    ObjectifyService.ofy().save().entity(this).now();
  }

  public void insertActivity(String activityName, Long duration) {
    Milestone source = new Milestone();
    source.save();
    SubProject subProject = new SubProject(activityName);
    subProject.save();
    subProjects.add(Ref.create(subProject));
    insertActivity(activityName, duration, source, subProject);
  }

  public void insertActivity(String activityName, Long duration, Milestone source, SubProject sourceProject, Milestone destination, SubProject destProject) {
    sourceProject.calculatedSinceLastUpdate = false;
    destProject.calculatedSinceLastUpdate = false;
    Activity newActivity = new Activity(activityName, duration, source, destination);
    source.nextActivities.add(newActivity);
    source.save();
    if (source == sourceProject.start.get() && 
        destination == destProject.end.get()) {
      destProject.end = sourceProject.end;
      subProjects.remove(Ref.create(sourceProject));
      ObjectifyService.ofy().delete().entity(sourceProject);
    } else if (source == sourceProject.end.get() &&
               destination == destProject.start.get()) {
      sourceProject.end = destProject.end;
      subProjects.remove(Ref.create(destProject));
      ObjectifyService.ofy().delete().entity(destProject);
    }
  }

  public void insertActivity(String activityName, Long duration, Milestone source, SubProject subProject) {
    subProject.calculatedSinceLastUpdate = false;
    Milestone destination = new Milestone();
    destination.save();
    Activity newActivity = new Activity(activityName, duration, source, destination);
    source.nextActivities.add(newActivity);
    source.save();
    System.out.println("Added: " + newActivity.name);
  }
}
