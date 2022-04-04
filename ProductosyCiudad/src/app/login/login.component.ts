import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
//import { Console } from 'console';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  form: FormGroup;
  loading: boolean;
  errors: boolean;

    constructor(
    fb: FormBuilder,
    private router: Router,
    private authService: AuthService
  ) {
    this.form = fb.group({
      email: [
        '',
        [Validators.required, Validators.email]
      ],
      password: [
        '',
        Validators.required
      ]
    });
  }

  ngOnInit(): void {
  }


  login(): void {
    this.loading = true;
    this.errors = false;
    this.authService.login(this.controls.email.value, this.controls.password.value)
      .subscribe((res: any) => {

        localStorage.setItem('access_token', res.access_token);


        this.authService.listarciudades()
            .subscribe((res: any) => {
      
              localStorage.setItem('ciudades', JSON.stringify(res));
              

                          this.authService.listarproductos()
                          .subscribe((res: any) => {
                    
                            localStorage.setItem('productos', JSON.stringify(res));
                            
                            this.loading = false;
                            this.router.navigate(['/']);
                          }, (err: any) => {
                            this.loading = false;
                            this.errors = true;
                          });
            }, (err: any) => {
              this.loading = false;
              this.errors = true;
            });


       
      }, (err: any) => {
        
        this.loading = false;
        this.errors = true;
      });
  }

  get controls() {
    return this.form.controls;
  }

}
