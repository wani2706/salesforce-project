import { LightningElement, wire } from 'lwc';
import getProfileDetails  from '@salesforce/apex/LicenseAllocator.getProfileInfo';

export default class ProfileDisplay extends LightningElement {
    profiles;
    columns = [
        {label: 'Name of Profile',  fieldName: 'Name',  type:'text'},
        {label: 'License Type', fieldName: 'UserLicenseName', type:'text'},
    ];

    @wire(getProfileDetails) profiles({error, data}){

        if(data){
            this.profiles = data.map(profile => {
                return {
                    Id: profile.Id,
                    Name: profile.Name,
                    UserLicenseName: profile.UserLicense.Name,
                };
            });
        }
        else{
            if(error){
                console.log(error);
            }
        }

        //alert('Response from server data: '+ JSON.stringify(data));
        //alert('Response from server error: ' + JSON.stringify(error));
    }
}