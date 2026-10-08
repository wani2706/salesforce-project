import { LightningElement, api, track} from 'lwc';

export default class AccountList extends LightningElement {
    name = 'Stefan';
    @api favTeam = 'India';

    @track age = 35;

    @api tryingTHIS = 'Hello';
}