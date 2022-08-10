// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



$(document).ready(function()

{
    
   $('#personal_information_marital_status').on("change",function(e){
   
       var marital_status=e.target.value;
       alert(marital_status);
    //    console.log(data_book)
//        $.ajax({
//         type:"GET",
//         url: "/getid/id",
//         data: {data: country},
       

//         success: function(data){
            
//             console.log("ok"+country);
// },
//     error: function(XMLHttpRequest, textStatus, errorThrown){
//      console.log(XMLHttpRequest.responseText);
//     }
//     });

   });
}
);