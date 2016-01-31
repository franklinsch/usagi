package com.example.usagi;

import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.Ref;

import java.lang.String;
import java.util.Date;
import java.util.List;

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
public class Activity {
  public Ref<Milestone> destination;
  public String name;
  public Long duration;

  public Activity(String name, Long duration) {
    Milestone destination = new Milestone();
    destination.save();

    this.destination = Ref.create(destination);
    this.name = name;
    this.duration = duration;

    System.out.println("Creating activity with name: '" + name + "'; duration: '" + duration + "'");
  }
}
