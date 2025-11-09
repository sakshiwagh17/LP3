//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BCT_Student {
    //structure to store student details
    struct Student {
        uint studentId;
        string name;
        uint age;
        uint256 marks;
    }

    //Array to store multiple student
    Student[] public student;

    //Event to log student addition
    event StudentAdded(uint studentId, string name, uint age, uint256 marks);
    //Event to log fallback call
    event Fallbackcalled(address sender, uint value, string message);

    //Function to add a student
    function addStudent(uint _studentId,string memory _name,uint _age,uint256 _marks) public {
        student.push(Student(_studentId, _name, _age, _marks));
        emit StudentAdded(_studentId, _name, _age, _marks);
    }

    //Function to get student details by index
    function getStudent(uint256 index) public view returns (uint256, string memory, uint, uint256) {
        require(index < student.length, "Student not found");
        Student memory s = student[index];
        return (s.studentId, s.name, s.age, s.marks);
    }

    //funtion to get total student
    function getTotalStudents() public view returns (uint256){
        return student.length;
    }

    // Fallback function to handle direct Ether transfers or unknown calls
    fallback() external payable{
        emit Fallbackcalled(msg.sender,msg.value,"Fallback triggered!");
    }

    // Receive function to handle plain Ether transfers
    receive() external payable{
        emit Fallbackcalled(msg.sender,msg.value,"Ether received");
    }
}
