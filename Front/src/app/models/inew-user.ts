export interface InewUser {
  nombre: string;
  apellido: string;

  alias: string;
  dni: number;
  telefono: number;
  email: string;
  nomUsuario: string;
  password: string;
  idPais: number;
  idProvincia: number;
  idLocalidad: number;
  calle: string;
  altura: number;
}

export interface InewDestino {
  alias: string;
  nombre: string;
  apellido: string;
  email: string;
}

export interface IgetDestinos {
  idUserDestino: number;
  alias: string;
  nombre: string;
  apellido: string;
  email: string;
  idUserOrigen: number;
}

export interface Iemail {
  email: string;
}

export interface Ipassword {
  password: string;
  passwordsegunda: string;
  token: string;
}

export interface Ilogin {
  userName: string;
  passWord: string;
}
