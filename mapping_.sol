


//Create a mapping that takes the key as a city name and the value as a country name.
///reate a function takes two inputs as strings to stores those inputs
//Create a function takes one input as a string that returns the value of the key


pragma solidity >=0.7.0 <0.8.0;

contract _mapping {
    
    mapping (string => string) country;
    
    function _add (string memory _city , string memory _country) public {
        
        country[_city]= _country;
        
        
    }
    
    
    function _read(string memory _name) public view returns(string memory) {
        
        return country[_name] ; 
    }


    
    
}


