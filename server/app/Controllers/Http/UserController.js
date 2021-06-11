'use strict'

const User = use('App/Models/User');

class UserController {

    async login ({ request, auth }) {
        
        const {email, password} = request.all();
        const token = await auth.attempt(email, password);
        return token;
    }

    async signup ({ request }) {

        const {email, password} = request.all(); //destructuracion de objetos, obtenemos los valores que enviaron via post en request
        await User.create({
            email,
            password,
            username: email
        });

        return this.login(...arguments);
    }
}

module.exports = UserController
