package com.example.usagi;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
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
public class Milestone {
  @Id public Long id;

  public List<Activity> nextActivities;
  public Long timeSinceStart = new Long(0);

  public Milestone() {
    nextActivities = new ArrayList<Activity>();
  }

  public void save() {
    ObjectifyService.ofy().save().entity(this).now();
  }
}
