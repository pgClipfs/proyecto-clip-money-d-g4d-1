import { User } from '../models/userToke';

export default function getUser(): string {
  const user: User = JSON.parse(localStorage.getItem('currentUser' || '{}'));

  console.log(user.username);
  return user.username;
}
