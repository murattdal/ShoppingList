const loginText = document.querySelector(".title-text .login");
const loginForm = document.querySelector("form.login");
const loginBtn = document.querySelector("label.login");
const signupBtn = document.querySelector("label.signup");
const signupLink = document.querySelector("form .signup-link a");
signupBtn.onclick = (()=>{
  loginForm.style.marginLeft = "-50%";
  loginText.style.marginLeft = "-50%";
});
loginBtn.onclick = (()=>{
  loginForm.style.marginLeft = "0%";
  loginText.style.marginLeft = "0%";
});
signupLink.onclick = (()=>{
  signupBtn.click();
  return false;
});

function checkPasswords() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
  
    if (password !== confirmPassword) {
      alert("Şifreler uyuşmuyor. Lütfen tekrar kontrol edin.");
      return false;
    }

    const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    if (!passwordPattern.test(password)) {
        alert("Şifre en az 8 karakter olmalı ve büyük harf, küçük harf ve rakam içermelidir.");
        return false;
    }
  
    return true;
  }