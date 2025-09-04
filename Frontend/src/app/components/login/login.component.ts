import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { Router } from '@angular/router';
import { AccountService, LoginRequest } from '../../services/account.service';
import {
  AuthService,
  FacebookLoginResponse,
} from '../../services/auth.service';
import { TokenService } from '../../services/token.service';
import { SocialLoginModule } from 'angularx-social-login';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [RouterModule, CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent {
  phoneNumber: string = '';
  password: string = '';

  constructor(
    private accountService: AccountService,
    private tokenService: TokenService,
    private authService: AuthService,
    private router: Router
  ) {}

  // Hỗ trợ chỉ cho phép nhập số và giới hạn độ dài số điện thoại
  validatePhoneNumber(): void {
    this.phoneNumber = this.phoneNumber.replace(/[^0-9]/g, '').slice(0, 11);
  }

  onSubmit(): void {
    if (!this.phoneNumber || !this.password) {
      alert('Please fill in all fields.');
      return;
    }

    const payload: LoginRequest = {
      PhoneNumber: this.phoneNumber,
      Password: this.password,
    };

    this.accountService.login(payload).subscribe({
      next: (response: any) => {
        this.tokenService.setToken(response.token);
        console.log('Response:', response);
        // Bạn có thể chuyển hướng hoặc cập nhật trạng thái đăng nhập tại đây.
        this.router.navigate(['/home']);
      },
      error: (error: any) => {
        console.error('Login error:', error);
        alert('Login failed. Please check your credentials.');
      },
    });
  }
  // Hàm gọi đăng nhập Facebook thông qua service
  onFacebookLogin(): void {
    this.authService.loginWithFacebook().subscribe({
      next: (response: any) => {
        this.tokenService.setToken(response.token);
        // Chuyển hướng tới trang chủ hoặc trang cần thiết
        this.router.navigate(['/home']);
      },
      error: (error) => {
        console.error('Facebook login failed', error);
        alert('Facebook login failed');
      },
    });
  }
}
