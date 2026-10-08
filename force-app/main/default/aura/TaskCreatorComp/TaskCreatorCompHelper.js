({
    createTaskRecord : function(component) {
        //fetch var values from imput fields and call server side to create task
        console.log('Reached here to call Apex method');
        let subject = component.get('v.subject');
        let description = component.get('v.description');
        let dueDate = component.get('v.dueDate');
        console.log('values are set' + subject);

        var action = component.get("c.creaateTaskRecord");
        action.setParams(
            { subject : subject, description: description, dueDate: dueDate}
        );

        action.setCallback(this, function(response) {
            var state = response.getState();
            alert(response.getReturnValue());
        });

        
        $A.enqueueAction(action);
    }
})