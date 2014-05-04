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

Using DDD wit rails 
====================
examples using DDD wit rails

##controller

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
```
##services

```ruby
#services on Domain/Services
class TerrainServices < BaseServices
  def create (terrain)
    unless terrain.document?
      raise "terrain need a document"
      
    @repository.create(terrain)
  end
end
```

##entities

```ruby
#entity in domain/entities.
class TerrainEntity < BaseEntity
  attr_accessor :width, :height,
                :street, :number, :district, :city, :state, :zip_code,
                :state, :value, :quota, :number_quote,
                :type, :condominium_tax, :condominium, :iptu, :public_documentation,
                :private_documentation, :other_documentation, :terms_documentation,
                :observation

  def size
    @width * @height
  end
end
```

##repository

```ruby
#entity in domain/repositories.
class TerrainRepository < BaseRepository
end

class BaseRepository
  attr_accessor :context

  def initialize (model)
    @context = Resolver.resolve model
  end

  def create (entity)
    load entity
    @context.save && @context if @context.valid?
  end

  protected

  def load (entity)
    @context.attributes = entity.to_hash
  end
end
```


Using IoC
==========

```ruby
#resolver in ioc/
class Resolver < Modules
  def self.resolve (dependecy)
    modules dependecy
  end
end

class Modules
  protected

  def self.modules (dependecy)
    case dependecy.name
    when 'Terrain' then Terrain.new
    when 'TerrainRepository' then TerrainRepository.new Terrain
    when 'TerrainServices' then TerrainServices.new modules TerrainRepository
    else nil end
  end
end
```


Setting DDD
=============
In config/application.rb

```ruby
  ...
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/domain/entities)
    config.autoload_paths += %W(#{config.root}/domain/services)
    config.autoload_paths += %W(#{config.root}/domain/repositories)
    config.autoload_paths += %W(#{config.root}/ioc)
  end
```
