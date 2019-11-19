function login()	{
    let username = document.querySelector('form	input[id="input"]').value;
    let password = document.querySelector('form	input[id="input2"]').value;
    (username + " " + password).submit();
}
function succeed() {
    alert("Login success!")
}
function fail() {
    alert("Wrong username or password!")
}


