'use strict'
const Project = use('App/Models/Project');
const Task = use('App/Models/Task');
const AuthorizationService = use('App/Services/AuthorizationService')

class TaskController {

    /* Retorna todas las tareas de un proyecto en especifico, se debe enviar como param, el id del proyecto */
    async index ({auth, request, params}) {
        const user = await auth.getUser();
        const { id } = params;
        const project = await Project.find(id);
        AuthorizationService.verifyPermission(project, user);
        return await project.tasks().fetch();
    }

    /* crea un nuevo task, se debe enviar como param el id del proyecto para poderlo asociar al task */
    async store ({auth, request, params}) {
        const user = await auth.getUser();
        const { description }  = request.all();
        const { id } = params;
        const project = await Project.find(id);
        AuthorizationService.verifyPermission(project, user);

        const task = new Task();
        task.fill({
            description
        });

        await project.tasks().save(task)
        return task;
    }
}

module.exports = TaskController
