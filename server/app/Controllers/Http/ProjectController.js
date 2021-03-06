'use strict'
const Project = use('App/Models/Project');
const AuthorizationService = use('App/Services/AuthorizationService')

class ProjectController {

    async index({ auth }) {
        const user = await auth.getUser();
        //const projects = await Project.query().paginate(1,10)  de esta forma retornamos con paginador
        return await user.projects().fetch();
    }

    async store({ auth, request }) {
        const user = await auth.getUser();
        const { title } = request.all();
        const project = new Project();
        project.fill({
            title
        });
        // const project = await Project.create({title: project.title, user_id: user.id}) otra forma de guardar
        await user.projects().save(project);
        return project;
    }

    async update ({auth, params, request}) {
        const user = await auth.getUser();
        const { id } = params;
        const project = await Project.find(id);
        AuthorizationService.verifyPermission(project, user);

        project.merge(request.only('title'));
        await project.save();
        return project;
    }

    async destroy ({auth, params}) {
        const user = await auth.getUser();
        const { id } = params;
        const project = await Project.find(id);

        AuthorizationService.verifyPermission(project, user);

        await project.delete();
        return project;
    }
}

module.exports = ProjectController
