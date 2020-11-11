

const country = document.querySelector('#country');
const search = (event) => {

fetch("https://places-dsn.algolia.net/1/places/query" ,{
method: "POST",
body: JSON.stringify({query: event.currentTarget.value})
})
  .then(response => response.json())
  .then((data) =>
   {
    country.innerHTML = "";   
    console.log(data.hits);
   data.hits.forEach((res) => {
    country.insertAdjacentHTML("beforeend",res.city.default[0]);
   })
    
});


};


const input  = document.querySelector('#address-input');
input.addEventListener("keyup" , search);


