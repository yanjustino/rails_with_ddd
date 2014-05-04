What is Domain-Driven Design?
============================
Over the last decade or two, a philosophy has developed as an undercurrent in the object community. The premise of domain-driven design is two-fold:

For most software projects, the primary focus should be on the domain and domain logic; and
Complex domain designs should be based on a model.
Domain-driven design is not a technology or a methodology. It is a way of thinking and a set of priorities, aimed at accelerating software projects that have to deal with complicated domains.

To accomplish that goal, teams need an extensive set of design practices, techniques and principles. Refining and applying these techniques will be the subject of discussion for this site, generally starting from the language of patterns laid out in Domain-Driven Design, by Eric Evans.


rails with ddd
==============

Rails with DDD is a template that implements DDD (Domain Driven Design) on Rails Framework. This proposal is a alternative to default architecture used by RoR. With DDD you can isolate your application, taking off the domain rules from the framework. This ensures that your application don't need, necessarily, stay with same Framework or ORM, for example.

How it works
=============

Two folders were created (Domain and IOC). Domain Folder contains entities, services and repositories. IOC contains a logic to resolver dependecies 

 * domain = Domain Layer contains a business rules
  * entities = PORO objects represents the entities of domain
  * services = business services
  * repositories = abstract ORM operations
  
 * ioc = Inversion of Control and DI

###using 

```ruby
#controller
class TerrainController < ApplicationController
  def initialize
    # instance of Service
    @service = Resolver.resolve TerrainServices
  end

  def create
    entity = TerrainEntity.new {width: 10, height: 10} 

    terrain = @service.create entity
    render json: terrain.to_json
  end
end

#services on Domain/Services
class TerrainServices < BaseServices
  def create (terrain)
    unless terrain.document?
      raise "terrain need a document"
      
    @repository.create(terrain)
  end
end


```
 

