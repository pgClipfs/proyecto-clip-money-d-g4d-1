import { User } from '../models/userToke';
import jwt_decode from 'jwt-decode';

function getUser(): string {
  const user: User = JSON.parse(localStorage.getItem('currentUser' || '{}'));
  const tokenjwt: string = user.token;
  return tokenjwt;
}

function getDecodedAccessToken(token: string): any {
  try {
    return jwt_decode(token);
  } catch (Error) {
    return null;
  }
}
const tokenInfo = getDecodedAccessToken(getUser()); // decode token
export const userLogin = tokenInfo.unique_name; // get token expiration dateTime
console.log(userLogin); // show decoded token object in console
