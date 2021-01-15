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
  idUsuario: number;
  alias: string;
  nombre: string;
  apellido: string;
  email: string;
}

export interface IgetDestinos {
  idUsuario: number;
  alias: string;
  nombre: string;
  apellido: string;
  email: string;
  idDestino: number;
  id: number;
}
