This a RefineryCMS plugin for managing slideshows in the backend. It's intended to include some kind of helper + JS code so we can have a slideshow without having to write again the HTML, but for now thatś just a dream.

Installing
==========

In Gemfile `gem "refinerycms-slideshow", "~> 2.0.10.0"`

Current status
==============

The plugin right now includes a backend that allow us to create a slideshow and attach it slides with images, videos and an html body.

It also includes a way to attach a slideshow to an object and add it to that object's admin.


Attaching an Slideshow to a model
===================================

To attach an slideshow to a model you must:

1) Generate a migration with an slideshow id field `rails g migration AddSlideshowToModel slideshow_id:integer`

2) Include the slideshow concern into the model and attach the slideshow

```ruby
class Model < ActiveRecord::Base

  include Refinery::Slideshow::Concerns::ModelWithSlideShow

  attach_slideshow :slideshow

end
```

This will use the previously created slideshow_id field to create a `belongs_to` relationship, so if you want another name for your slideshow (e.g. `attach_slideshow :cool_slideshow`) you will have to name your id_field in a different way in the migration (e.g. `rails g migration AddSlideshowToModel cool_slideshow_id:integer`)

3) Use the slides partial in this model's admin:

```ruby
  <%= render 'refinery/slideshow/admin/slides/index', slideshow: f.object.slideshow %>
```

4) Depending on your scenary you may (or may not) need to initialize your slideshow attribute. By default, every time you access to the attached slideshow we are creating it:

```ruby
  object_model.slideshow # -> Voilá! We have created one slideshow on DB
```

But sometimes you don't want this behaviour (e.g. I only want blog posts from some category to include a slideshow). You can achieve this by overwriting a special method in the class called `needs_slideshow?`.

```ruby

class Model < ActiveRecord::Base

  include Refinery::Slideshow::Concerns::ModelWithSlideShow

  attach_slideshow :slideshow

  def needs_slideshow?
    # Just return a boolean. True if we must create it, False if we must not
  end

end
```

Again, if you use some different slideshow name (we used previously `cool_slideshow`) this method would be named after that slideshow name (`needs_cool_slideshow?`)

To Do
=====

* Some default front helpers: This way we could have a slideshow running without any extra front effort
