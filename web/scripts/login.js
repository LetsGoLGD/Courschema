// TODO: add check to username and password
$(document).ready(function () {
   $
});

function onClickSendEmail() {
   let emailAddress = document.querySelector('form	input[name="email-address"]').value;
   let emailRegex = new RegExp(/^(\w)+([-+.]\w+)*@\w+([-.]\w+)*\..\w+([-.]\w+)*$/);
   if (!emailRegex.test(emailAddress)){
      alert("Wrong email format!");
      // document.getElementById('id01').style.display='block';
   } else {
       // Send verify email
       //TODO: save the verify code to database and change the status of user
       let verify_code = randomNum(1000, 9999);
       var template_params = {
         "email_address": emailAddress,
         "message_html": verify_code + ""
       };

       var service_id = "default_service";
       var template_id = "template_AZjAxIpG";

       emailjs.send(service_id, template_id, template_params)
           .then(function(response) {
               console.log('SUCCESS!', response.status, response.text);
                alert("Sent verify code successfully!");
                document.getElementById('id02').style.display='block';
                document.getElementById('id01').style.display='none';
                }, function(error) {
                console.log('FAILED...', error);
                alert("Failed to send verify code!");
                });
   }
}

function randomNum(minNum,maxNum){
    if (arguments.length === 1) {
        return parseInt(Math.random() * minNum + 1, 10);
    } else if (arguments.length === 2) {
        return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10);
    } else {
        return 0;
    }
}
