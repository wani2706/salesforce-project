import { LightningElement } from 'lwc';

export default class IteratorFramework extends LightningElement {

    taskList = [
       {taskId: 1, taskName: 'Task 1', taskPriority: 'High', taskProgress: 'In Progress'},
       {taskId: 2, taskName: 'Task 2', taskPriority: 'Medium', taskProgress: 'Pending'},
       {taskId: 3, taskName: 'Task 3', taskPriority: 'Low', taskProgress: 'Pending'}
    ]
}