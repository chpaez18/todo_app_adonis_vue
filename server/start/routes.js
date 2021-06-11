'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.group(()=>{

  /* AUTH */
  Route.post('auth/login','UserController.login');
  Route.post('auth/signup','UserController.signup');

  /* PROJECTS */
  Route.get('projects','ProjectController.index').middleware('auth');
  Route.post('projects/store','ProjectController.store').middleware('auth');

}).prefix('api/v1')