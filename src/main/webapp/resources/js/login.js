
            var loginform = document.getElementById('loginform');
            var signupform = document.getElementById('signupform');
            var back = document.getElementById('back');
            var gosignup = document.getElementById('gosignup');

            window.onclick = function (event) {
                if (event.target == loginform || event.target == back || event.target == gosignup) {
                    loginform.style.display = "none";
                    if (event.target == gosignup) {
                        signupform.style.display = "block";
                    }
                }
                if (event.target == signupform) {
                    signupform.style.display = "none";
                }
            }
