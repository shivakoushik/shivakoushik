({
    doInit : function(component, event, helper) {
      
         var action = component.get("c.getObjectlist");

        action.setCallback(this,function(res){
            if(res.getState()==="SUCCESS"){
                console.log('----->');
                console.log(res.getReturnValue());
                console.log("Account saved Successfully");
                component.set('v.objName',res.getReturnValue());
               // alert("new account inserted");
            }
        })
        $A.enqueueAction(action);
    },

    
      onChange: function(component, event, helper){
       
       console.log(component.find("objectn").get("v.value"));
          
           var action = component.get("c.getIconName");
        action.setParams({ "sObjectName1" : component.find("objectn").get("v.value")});
        action.setCallback(this, function(response) {
           component.set("v.iconName", response.getReturnValue() );
        });
        $A.enqueueAction(action);
          
    },
})