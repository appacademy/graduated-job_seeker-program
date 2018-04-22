# BenchBNB Redux!

Today's goal is to take everyone's favorite project, BenchBnB and rebuild it's Redux structure.  

Every other piece of this version of BenchBnB is already complete.  The components, util files, and the entire backend are all built out and functional.  The only thing missing is state management, which you will implement with Redux.

**The README below will provide loose guidance and a recommended order to rebuild.  If you would like a refresher on the original project, use these links:**

*  [**Part 1 Instructions**](bench_bnb_i.md)
*  [**Part 2 Instructions**](bench_bnb_ii.md)

## Goals:
The goal of this project is to rebuild the missing Redux state. **This project and its' instructions are intentionally vague and difficult**, this is to challenge you to remember how the redux cycle is put together and how it works.  We will work through rebuilding sessions together, but you will need to rebuild the rest on your own.  **The App will not work unless all of the reducer structure has been rebuilt.**

#### Sample State:

``` getState() ``` has been applied to the window for you for debugging purposes.  It will be the easiest way for you to see if you are on track.  Ultimately, you want your frontend state to look like this:

```javascript
{
  entities: {
    benches: {
      1: {id: 1, description: "alamo square, many dogs", lat: 37.775769, lng: -122.43496, seating: 4, …},
      2: {id: 2, description: "UN plaza, food truck access", lat: 37.77976, lng: -122.41382, seating: 2, …}
    },
    reviews: {}
  },
  errors: {
    session: []
  },
  sessions: {
    currentUser: null;
  },
  ui: {
    filters: {
      bounds: {
        northEast: {lat: 37.80788593713507, lng: -122.38838165576169},
        southWest: {lat: 37.74004249934129, lng: -122.47421234423825},
        maxSeating: 10,
        minSeating: 1
      }
    }
  }  
}
```  

### Step One: Re-Acquaint Yourself
Download the [skeleton](https://github.com/appacademy/graduated-job_seeker-program/raw/master/projects/bench_bnb_redux/skeleton.zip)

Take a moment to look over the provided backend and frontend files and remember how BenchBnB works.  Pay close attention to the schema and how the information is served up in the jBuilder views.  Remember, you can always reference the instructions (and solution if ABSOLUTELY necessary) from the original project.

As with any rails project make sure you run the following:
* ```bundle install```
* ```rails db:setup```
* ```npm install```
* ```npm run webpack```
* ```bundle exec rails s```

### Step Two: Rebuild the File Structure
You likely noticed that the ``` frontend ``` folder in the file tree is a little lacking.  Add the following folders to the tree:
* ```actions```
* ```reducers```
* ```store```

### Step Three: Actions and Action Creators
Next we will rebuild some of our actions and action creators starting with ``` sessions ```.

Start by looking at ``` session_api_util.js ``` and familiarizing yourself with the AJAX calls.  

Next, create a new file under ```actions``` called ```session_actions.js```

Inside ```session_actions.js``` do the following:
* Import all of the session api AJAX calls

* Create constants for your action types, it's recommended you use ```RECEIVE_CURRENT_USER```, and ```RECEIVE_SESSION_ERRORS```.

*  Create your standard Action Creator functions.  Remember that action creators should return a POJO with a ```type``` property and any additional data you wish to pass to the reducers.

* Create your Thunk Action Creators.  Remember that thunk actions will curry in arguments and return functions.  The first curried argument will be whatever data is to be used, the second curried argument will be ```dispatch```. The function will return an appropriate api call followed by a ```.then()``` handling either success or failure of the AJAX request.

* You should end up with three thunk action creators and two action creators.  (Hint: you should have a thunk action for each of the APIUtil AJAX requests.  You should have two normal action creators: one for receiving the current user, and one for receiving errors.)

### Step Four:  Rebuild your Reducers
Next we will begin rebuilding our reducers.

Start by navigating to your ```reducers``` directory and adding these two files: ```session_reducer.js``` and ```session_errors_reducer.js```.

In ```session_reducer.js``` do the following:

* Import ```merge``` from lodash/merge, and the necessary action type constant from you session actions. (Do not use ```Object.assign()``` for this project.)

* Create a ```_nullUser ``` default object. It should have a key of ```currentUser``` pointing to ```null```. (This step is optional but can be very beneficial for establishing your default state shape.)

* Build your reducer function.  Remember every action will hit every reducer.  Your reducer should listen for the action's type and execute logic accordingly to merge the new information into state if necessary.  The reducer should always have a default return value of the state it receives if no logic is executed.

* Remember to export default your reducers!

Next, create an ```entities_reducer.js``` file and a ```root_reducer.js``` file in your ```reducers``` directory.  Import your ```session_reducer``` into your ```entities_reducer``` and using ```combineReducers()``` export entities. Follow the sam pattern to add entities to your ```root_reducer```.

### Step Five: Construct your Store
The last step is to build the redux store and apply it to the entry file.

Navigate to your ```store``` directory and create a new file: ```store.js```.

In ```store.js``` do the following:

* Import ```createStore```, ```applyMiddleware```, ```thunk```, ```logger```, and your ```root_reducer``` from their appropriate libraries/locations.

* Construct a ```configureStore``` function. It should:
  * take in an optional preloaded state
  * invoke ```createStore()``` passing in your ```root_reducer```, preloadedState, and ```applyMiddleware()``` invoked with the appropriate middleware as arguments.

* Export default your ```configureStore``` function.

### Step Six: Putting it together
This last step is the easiest.  Navigate to your entry file, ```bench_bnb.jsx```.  Ensure that all of your filenames/imports match up properly and that ```getState``` is still on the window.

There will be one more thing missing to attach redux to your application.  Do you know what it is? (Hint: check your ```root.jsx``` component.)

### Step Seven: Wash, Rinse, Redux
Congratulations!  You just built out the foundation of your redux state management and its' first piece of reduced frontend state.

Follow this same order of operations to build out the ```session_errors_reducer``` and your errors slice of state, the benches slice of state, then eventually the ui slice of state incorporating the GoogleMapsAPI.

_**NB:** things will get a little more complicated when it comes to managing the ui slice of state.  It's definitely recommended you use the original project instructions to help you through that phase._

Remember: this app will not function properly until redux is fully rebuilt.  Use ```getState()``` on the window to keep track of your state shape as you're building until you can interact with the app again.  


# GREAT WORK!
