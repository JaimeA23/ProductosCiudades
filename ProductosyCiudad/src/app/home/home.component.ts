import { Component, OnInit } from '@angular/core';

import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';


import { AuthService } from '../services/auth.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {


  accessToken: any;
  arrayproductos: any;
  arrayciudades: any;
  arrayciudadeseditar: { id:number,n: string,  la: string,lo: string, s: boolean,  }[] = [];
  loading: boolean;
  cards: { id:number,n: string, p: number,c: number, i: string,o: string,  }[] = [];
  selecard: { id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<any>,  }[] = [];
  editcard: { id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<any>,  }[] = [];
  crearcard: { id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<any>,  }[] = [];
  form: FormGroup;

  filesend:any;

  constructor(
    fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.filesend=null;
    this.accessToken = JSON.parse(localStorage.getItem('productos'));
    this.arrayproductos = JSON.parse(localStorage.getItem('productos'));
    this.cards = createcard(this.arrayproductos);
    this.form = fb.group({
      Nombre: [
        '',
        [Validators.required]
      ],
      Precio: [
        '',
        [Validators.required]
      ],
      Cantidad: [
        '',
        Validators.required
      ],
      Observacion: [
        '',
        Validators.required
      ]
    });
  }

  ngOnInit(): void {
    
  }

  logout(): void {
    this.loading = true;
    this.authService.logout()
      .subscribe(() => {
        this.loading = false;
        localStorage.removeItem('access_token');
        this.router.navigate(['/login']);
      });
  }

  formulariocreacion() { 
    this.filesend=null;
    this.selecard=[];
    this.editcard=[];


    let disponible=false;
    this.arrayciudadeseditar=[];
    this.arrayciudades = JSON.parse(localStorage.getItem('ciudades'));
    this.loading = true;
   
    const tempcard: { id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<any>,   }[] = [];


      this.arrayciudades.forEach((value: any, index: number) => {
      

        this.arrayciudadeseditar.push(
          {
            id: value.id,
            n: value.name,
            la: value.lat,
            lo: value.lon,
            s: disponible

          }
          
        )
        disponible=false;
       
      });

     tempcard.push({

        id:null,
        n: null, 
        p: null,
        c: null, 
        i: null,
        o: null, 
        ci: this.arrayciudadeseditar, 
  
      });


      this.selecard=[];
      this.editcard=[];
      
      this.crearcard=tempcard;


      this.loading = false;

  }

  agregarproducto() { 
    this.loading = true;


    let Nombre =this.controls.Nombre.value;
    let Precio =this.controls.Precio.value;
    let Cantidad =this.controls.Cantidad.value;
    let Observacion =this.controls.Observacion.value;
    let ciudades = [];

    this.crearcard[0].ci.forEach((value: any, index: number) => {

        if (value.s){

          ciudades.push(value.id);
        }
     
    });
    
    if(Nombre==""){
      Nombre=this.crearcard[0].n;
    }
    if(Precio==""){
      Precio=this.crearcard[0].p;
    }
    if(Cantidad==""){
      Cantidad=this.crearcard[0].c;
    }
    if(Observacion==""){
      Observacion=this.crearcard[0].o;
    }

    this.authService.onUpload(this.filesend,Nombre).subscribe((res: any) => {

    }, (err: any) => {

    });


    this.authService.crearproducto(Nombre,Precio,Cantidad,Nombre+".jpg",Observacion,ciudades) .subscribe((res: any) => {
      this.crearcard=[];
            this.authService.listarproductos()
            .subscribe((res: any) => {

              localStorage.setItem('productos', JSON.stringify(res));
              this.accessToken = JSON.parse(localStorage.getItem('productos'));
              this.arrayproductos = JSON.parse(localStorage.getItem('productos'));
              this.cards = createcard(this.arrayproductos);
             this.loading = false;
             this.router.navigate(['/']);
            }, (err: any) => {
           
            });

    }, (err: any) => {
   
    });


    
  }

  seleccionar(id) { 
    let disponible=false;
    this.arrayciudadeseditar=[];
    this.arrayciudades = JSON.parse(localStorage.getItem('ciudades'));
    this.loading = true;
    this.authService.verproducto(id) .subscribe((res: any) => {

      const tempcard: { id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<any>,   }[] = [];


      this.arrayciudades.forEach((value: any, index: number) => {
        

        res[1].forEach((value2: any, index: number) => {
        
       if(value2.id==value.id){
        disponible=true
       }
         
        });

        this.arrayciudadeseditar.push(
          {
            id: value.id,
            n: value.name,
            la: value.lat,
            lo: value.lon,
            s: disponible

          }
          
        )
        disponible=false;
       
      });
     
     tempcard.push({

        id:res[0].id,
        n: res[0].name, 
        p: res[0].precio,
        c: res[0].cantidad, 
        i: "http://localhost:8000/api/imagesee/"+res[0].imagen,
        o: res[0].observacion, 
        ci: this.arrayciudadeseditar, 
  
      });



      this.editcard=[];
      this.crearcard=[];

      this.selecard=tempcard;


      this.loading = false;
    }, (err: any) => {
     
    });

    
  }

  editar(id) {
    this.filesend=null;
    let disponible=false;
    this.arrayciudadeseditar=[];
    this.arrayciudades = JSON.parse(localStorage.getItem('ciudades'));
    this.loading = true;
    this.authService.verproducto(id) .subscribe((res: any) => {
      
      const tempcard: { id:number,n: string, p: number,c: number, i: string,o: string, ci: Array<any>,   }[] = [];


      this.arrayciudades.forEach((value: any, index: number) => {
        

        res[1].forEach((value2: any, index: number) => {
        
       if(value2.id==value.id){
        disponible=true
       }
         
        });

        this.arrayciudadeseditar.push(
          {
            id: value.id,
            n: value.name,
            la: value.lat,
            lo: value.lon,
            s: disponible

          }
          
        )
        disponible=false;
       
      });

     tempcard.push({

        id:res[0].id,
        n: res[0].name, 
        p: res[0].precio,
        c: res[0].cantidad, 
        i:"http://localhost:8000/api/imagesee/"+ res[0].imagen,
        o: res[0].observacion, 
        ci: this.arrayciudadeseditar, 
  
      });


      this.selecard=[];
      this.crearcard=[];
      this.editcard=tempcard;


      this.loading = false;
    }, (err: any) => {

    });

    
  }

  modificar() {


    let Nombre =this.controls.Nombre.value;
    let Precio =this.controls.Precio.value;
    let Cantidad =this.controls.Cantidad.value;
    let Observacion =this.controls.Observacion.value;
    let ciudades = [];

    this.editcard[0].ci.forEach((value: any, index: number) => {

        if (value.s){
   
          ciudades.push(value.id);
        }
     
    });
    
    if(Nombre==""){
      Nombre=this.editcard[0].n;
    }
    if(Precio==""){
      Precio=this.editcard[0].p;
    }
    if(Cantidad==""){
      Cantidad=this.editcard[0].c;
    }
    if(Observacion==""){
      Observacion=this.editcard[0].o;
    }


    this.authService.onUpload(this.filesend,Nombre).subscribe((res: any) => {

    }, (err: any) => {

    });

    this.authService.editarproducto(this.editcard[0].id,Nombre,
      Precio,Cantidad, Nombre +'.jpg',Observacion,ciudades) .subscribe((res: any) => {
        this.editcard=[];
        this.crearcard=[];
        this.authService.listarproductos()
        .subscribe((res: any) => {

                localStorage.setItem('productos', JSON.stringify(res));
                this.accessToken = JSON.parse(localStorage.getItem('productos'));
                this.arrayproductos = JSON.parse(localStorage.getItem('productos'));
                this.cards = createcard(this.arrayproductos);
              this.loading = false;
              this.router.navigate(['/']);
              }, (err: any) => {
            
              });

    }, (err: any) => {

    });

  }

  onFileChanged(event) {
    const file = event.target.files[0]
    this.filesend=file;
  }
  

  eliminar(id) { 

    this.authService.eliminarproducto(id) .subscribe((res: any) => {


      this.authService.listarproductos()
      .subscribe((res: any) => {

        localStorage.setItem('productos', JSON.stringify(res));
        this.accessToken = JSON.parse(localStorage.getItem('productos'));
        this.arrayproductos = JSON.parse(localStorage.getItem('productos'));
        this.cards = createcard(this.arrayproductos);
       this.loading = false;
       this.router.navigate(['/']);
      }, (err: any) => {
     
      });

      
    }, (err: any) => {

    });

    
  }




  get controls() {
    return this.form.controls;
  }

}


function createcard(data: any) {

  const cards: {  id:number,n: string, p: number,c: number, i: string,o: string,  }[] = [];
  data.forEach((value: any, index: number) => {

    cards.push({

      id:value.id,
      n: value.name, 
      p: value.precio,
      c: value.cantidad, 
      i: "http://localhost:8000/api/imagesee/"+value.imagen,
      o: value.observacion, 
    

    });
   
  });

  return cards;

}


