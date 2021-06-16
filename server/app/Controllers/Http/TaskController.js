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

    async indexTasks ({auth, request}) {
        const user = await auth.getUser();
        return await Task.all();
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

    async update ({auth, params, request}) {
        const user = await auth.getUser();
        const { id } = params;
        const task = await Task.find(id);
        const project = await task.project().fetch(); //traemos el proyecto asociado a la tarea, gracias al belongTo en el model Task
        AuthorizationService.verifyPermission(project, user);

        task.merge(request.only([
            'description',
            'completed'
        ]));
        await task.save();
        return task;
    }

    async destroy ({auth, params}) {
        const user = await auth.getUser();
        const { id } = params;
        const task = await Task.find(id);
        const project = await task.project().fetch(); //traemos el proyecto asociado a la tarea, gracias al belongTo en el model Tarea
        AuthorizationService.verifyPermission(project, user);

        await task.delete();
        return task;
    }
}

module.exports = TaskController
