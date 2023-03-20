// DOM-based XSS
var input = document.getElementById("user-input").value; // get user input from a text field
document.getElementById("output").innerHTML = input; // write user input to a div element

// RCE via eval
var input = document.getElementById("user-input").value; // get user input from a text field
eval(input); // execute user input as code

// Path manipulation via fs module
var fs = require("fs"); // import file system module
var input = process.argv[2]; // get user input from command line argument
fs.readFile(input, "utf8", function(err, data) { // read file from user input path
  if (err) throw err;
  console.log(data); // print file content to console
});
