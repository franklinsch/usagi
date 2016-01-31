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

  public String name;
  public List<Ref<SubProject>> subProjects;

  public Project() {}
  public Project(String name) {
    SubProject subProject = new SubProject(name);
    subProject.save();

    subProjects = new ArrayList<SubProject>();  
    subProjects.add(Ref.create(subProject));
    this.name = name;
  }

  public void save() {
    ObjectifyService.ofy().save().entity(this).now();
  }

  public void insertActivity(String activityName, Long duration) {
    Activity newActivity = new Activity(activityName, duration);
    for (Ref<SubProject> ref: subProjects) {
      SubProject subProject = ref.get();
      if (subProject.insertActivity(newActivity)) {
        return;
      }
    }
    Subproject newSubProject = new SubProject(activityName);
    newSubProject.insertActivity(newActivity);
    subProjects.add(newSubProject);
  }
}
