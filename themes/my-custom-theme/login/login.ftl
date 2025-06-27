<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      font-family: sans-serif;
      background-color: white;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .title-container {
      text-align: center;
      margin-bottom: 10px;
    }

    .title {
      font-size: 1.8em;
      font-weight: bold;
      position: relative;
      display: inline-block;
      padding-bottom: 8px;
    }

    .title::after {
      content: '';
      display: block;
      height: 5px;
      width: 100%;
      background-color: #3B0CA5;
      margin: 0 auto;
      border-radius: 2px;
    }

    .login-container {
      background-color: #A089D9;
      padding: 20px;
      border-radius: 30px;
      width: 90%;
      max-width: 360px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .input-group {
      position: relative;
      margin: 10px 0;
      width: 100%;
    }

    .input-field {
      width: 100%;
      padding: 10px 40px 10px 12px;
      font-size: 15px;
      border: none;
      border-bottom: 2px solid #3B0CA5;
      background: transparent;
    }

    .icon {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
    }

    .user-icon::before {
      content: '\1F464'; /* 👤 */
    }

    .lock-icon::before {
      content: '\1F512'; /* 🔒 */
    }

    .hide-icon::before {
      content: '\1F648'; /* 🙈 */
    }

    .forgot {
      align-self: flex-start;
      font-size: 13px;
      color: #3B0CA5;
      text-decoration: none;
      margin-bottom: 15px;
    }

    .btn-group {
      display: flex;
      flex-direction: column;
      gap: 10px;
      width: 100%;
      margin: 20px 0;
    }

    .btn {
      padding: 10px;
      border: none;
      border-radius: 20px;
      background-color: #3B0CA5;
      color: white;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
    }

    .triangle {
          position: absolute;
          left: -125px;
          top: 0;
          width: 0;
          height: 0;
          border-right: 250px solid transparent;
          border-bottom: 250px solid #A089D9;
          transform: rotate(-135deg);
          z-index: -1;
        }

    .google-btn {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      padding: 8px;
      border: 1px solid #ccc;
      background: white;
      border-radius: 6px;
      font-size: 15px;
      cursor: pointer;
      width: 100%;
    }

    .google-btn img {
      height: 18px;
    }

    @media screen and (max-width: 480px) {
      .title {
        font-size: 1.5em;
      }

      .login-container {
        padding: 15px;
        border-radius: 20px;
      }

      .btn,
      .google-btn {
        font-size: 15px;
        padding: 10px;
      }

      .forgot {
        font-size: 12px;
      }
    }
  </style>
</head>
<body>
<div class="triangle"></div>
  <div class="title-container">
    <h2 class="title">Login</h2>
  </div>

  <div class="login-container">
    <form id="kc-form-login" action="${url.loginAction}" method="post">
      <div class="input-group">
        <input type="text" name="username" placeholder="Username" class="input-field" />
        <span class="icon user-icon"></span>
      </div>

      <div class="input-group">
        <input id="password" type="password" name="password" placeholder="Password" class="input-field" />
        <span id="togglePassword" class="icon lock-icon"></span>
      </div>

      <a href="${url.loginAction}?action=forgot-credentials" class="forgot">Forgot Password?</a>

      <div class="btn-group">
        <button name="login" type="submit" class="btn login-btn">Login</button>
      </div>

      <div class="btn-group">
         <a href="exp://192.168.73.94:8081/signup" id="signUpLink" class="btn login-btn">Sign up</a>
      </div>

      <form action="${url.loginAction}" method="GET">
        <input type="hidden" name="client_id" value="${client.clientId}" />
        <input type="hidden" name="kc_idp_hint" value="google" />
        <button type="submit" class="google-btn">
          <img src="resources/img/google-icon.svg" alt="Google" /> Sign in with Google
        </button>
      </form>
    </form>
  </div>

  <script>
    const toggleIcon = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');

    toggleIcon.addEventListener('click', () => {
      const isPassword = passwordInput.type === 'password';
      passwordInput.type = isPassword ? 'text' : 'password';
      toggleIcon.classList.toggle('lock-icon', !isPassword);
      toggleIcon.classList.toggle('hide-icon', isPassword);
    });
  </script>
</body>
</html>
