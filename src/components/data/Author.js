export default class Author {
  constructor({ username, profilePicture = null }) {
    this.username = username;
    this.profilePicture = profilePicture;
  }
}
