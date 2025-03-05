import moment from 'moment';
import 'moment/dist/locale/fr';

moment.locale('fr');

export default class Post {
  constructor({ text = '', image = null, biography = null, author = null }) {
    this.id = Math.random().toString(16).slice(2);
    this.text = text;
    this.image = image;
    this.biography = biography;
    this.createdAtDays = moment(new Date()).format('dddd D MMMM');
    this.createdAtHours = moment(new Date()).format('HH:mm');
    this.timestamp = moment(new Date()).valueOf();
    this.author = author;
  }
}
