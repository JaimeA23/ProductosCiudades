import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  // Variables
  authUrl = 'http://localhost:8000/oauth/token';
  apiUrl = 'http://localhost:8000/api';
 // options: any;
  /**
   * Constructor
   * @param http The http client object
   */
  constructor(
    private http: HttpClient
  ) { }
  /**
   * conexion
   * @param e The email address
   * @param p The password string
   */
   login(e: string, p: string) {
    const options = {
      headers: new HttpHeaders({
        Accept: 'application/json',
        'Content-Type': 'application/json'
      })
    };
    return this.http.post(this.authUrl, {
      grant_type: 'password',
      client_id: '2',
      client_secret: 'IOD3ldrvjKtfsGtlr1Moq6Fx2XfHEbrwqj0Y9xgy',
      username: e,
      password: p,
      scope: ''
    }, options);
  }
  /**
   * desconeccion
   */
   logout() {
    const options = {
      headers: new HttpHeaders({
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + localStorage.getItem('access_token')
      })
    };
    return this.http.get(this.apiUrl + '/token/revoke', options);
  }

   /**
   * verproductos
   */
    listarproductos() {
      const options = {
        headers: new HttpHeaders({
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + localStorage.getItem('access_token')
        })
      };
      return this.http.get(this.apiUrl + '/productos', options);
    }


   /**
   * verciudades
   */
   listarciudades() {
        const options = {
          headers: new HttpHeaders({
            Accept: 'application/json',
            'Content-Type': 'application/json',
            Authorization: 'Bearer ' + localStorage.getItem('access_token')
          })
        };
        return this.http.get(this.apiUrl + '/ciudades', options);
   }

   descargarimg(nombre) {
    

    const options = {
      headers: new HttpHeaders({
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + localStorage.getItem('access_token')
      })
    };
    return this.http.get(this.apiUrl + '/imagesee/'+nombre, options);
}

    /**
   * crear
   */
     crearproducto(n: string, p: number,c: number, i: string,o: string, ci: Array<number>) {
      const options = {
        headers: new HttpHeaders({
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + localStorage.getItem('access_token')
        })
      };
      return this.http.post(this.apiUrl + '/crear', {

        name: n,
        precio: p,
        cantidad: c,
        imagen: i,
        observacion: o,
        ciudad: ci
      }, options);
    }

    /**
   * editar
   */
     editarproducto(id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<number>) {
      const options = {
        headers: new HttpHeaders({
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + localStorage.getItem('access_token')
        })
      };
      return this.http.post(this.apiUrl + '/editar', {

        id: id,
        name: n,
        precio: p,
        cantidad: c,
        imagen: i,
        observacion: o,
        ciudad: ci
      }, options);
    }

  /**
   * ver
   */
    verproducto( id: number) {
        const options = {
          headers: new HttpHeaders({
            Accept: 'application/json',
            'Content-Type': 'application/json',
            Authorization: 'Bearer ' + localStorage.getItem('access_token')
          })
        };
        return this.http.post(this.apiUrl + '/ver', {
  
          id: id,
        }, options);
    }

  /**
   * eliminar
   */
   eliminarproducto( id: number) {
          const options = {
            headers: new HttpHeaders({
              Accept: 'application/json',
              'Content-Type': 'application/json',
              Authorization: 'Bearer ' + localStorage.getItem('access_token')
            })
          };
          return this.http.post(this.apiUrl + '/eliminar', {
    
            id: id,

          }, options);
    }
    /**
    * imageup
    */
     imageupproducto(n: string, p: number,c: number, i: string,o: string, ci: Array<number>) {
      const options = {
        headers: new HttpHeaders({
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + localStorage.getItem('access_token')
        })
      };
      return this.http.post(this.apiUrl + '/imageup', {

        name: n,
        precio: p,
        cantidad: c,
        imagen: i,
        observacion: o,
        ciudad: ci
      }, options);
    }

    onUpload(filesend,Nombre) {
      const uploadData = new FormData();
      uploadData.append('image', filesend);
      uploadData.append('name', Nombre +'.jpg');



      const options = {
        headers: new HttpHeaders({
          Authorization: 'Bearer ' + localStorage.getItem('access_token')
        })
      };
      return this.http.post(this.apiUrl + '/imageup',uploadData , options);
    //  this.http.post('my-backend.com/file-upload', uploadData);
    }

}