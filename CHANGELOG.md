## 0.6.1

* Fix infinite recursion in getChild if route is root
* Add dispatchFutureModel
* Allow single character paths
* Add the AppPersistor

## 0.6.0

* Fix the state access error produced in BasePageState
* Update async_redux
  
## 0.5.1

* Remove unused import
  
## 0.5.0

* Improve routing of submodules
* Handled submodules via routeName configuration
* Adapt a logger
* Update the submodules example to comply with framework updates

## 0.4.0

* Added type checking when retrieving data from the store
* Defined the types of BaseRoutes.routes and BaseRoutes.defaultModule properly
* Handled navigator routing for submodules
* Added BuildContext to BaseStatefulPageView.beforeLoad() and beforeUpdate()
* Fetched route objects based on either the context or the specified routeName
* Added BaseNavigation.getRouteName()
  
## 0.3.1

* Added repository to pubspec
  
## 0.3.0

* Provided full documentation on the API and README
* Defined type of BaseStatefulPageView.specs
* Updated the definitions of beforeLoad() and beforeUpdate() of BaseStatefulPageView

## 0.2.5

* Updated the butter logo
* Added pub.dev and travis badges

## 0.2.4

* Restored deleted BaseAction default constructor

## 0.2.3

* Removed BaseDispatcher.dispatchAttribs()
* Fixed the reduce() definition of BaseAction
* Added docs to BaseAction and BasePageState

## 0.2.2 

* Fixed various health issues and suggestions reported by pub.dev

## 0.2.1 

* Allowed models to overwrite data in the store
* write(), dispatchModel() and mutate() now have an overwrite parameter 

## 0.2.0]

* Split BasePageView into BaseStatefulPageView and BaseStatelessPageView
* Provided BaseStatefulPageView to support smart page loads and updates
* Provided baseline implementation for nested modules capability
* Allowed mother pages to retrieve elements from child pages

## 0.1.0 

* Incremented minor version due to breaking changes

## 0.0.3 

* Discontinued the use of store attributes
* Introduced model keys
* Properly define generic types

## 0.0.2 

* Made defaultTransition as optional in BaseRoutes

## 0.0.1 

* Initial release
