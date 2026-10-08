import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {

    userName = 'Jammie';
    standing = 9;
    watchTime = new Date().toLocaleString();

    totalLessonsWatched = 50;

    userInput;

    handleInputChange(event) {
        this.userInput = event.target.value;
    }

    _minutesWatched = (this.totalLessonsWatched * 10);

    get minutesWatched() {
        return this._minutesWatched;
    }

    set minutesWatched(value) {
        this._minutesWatched = value < 1000 ? value : 5000;

    }

    handleWatchChange(event) {
        this.minutesWatched = parseInt(event.target.value);
    }

}