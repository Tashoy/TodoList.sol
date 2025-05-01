//SPDX-License-Identifier: MIT
 pragma solidity ^0.8.26;

 contract TodoList {
        enum Status {
    Pending,
    InProgress,
    Completed
 }

struct Todo{
    uint id;
    string content;
    Status  status; 

}
mapping(uint=> Todo) public todos;
uint[] public todoIds;
uint private nextId = 1;

event TodoAdded(uint id, string content);

function addTodo(string memory content) public{
    todos[nextId] = Todo(nextId,content, Status.Pending );
    todoIds.push(nextId);
    emit TodoAdded(nextId, content);
    nextId++;
}

function updateStatus(uint id, Status status) public{
    require(id < nextId, "Todo with given ID does not exist");
    todos[id].status = status;
}


function getTodo(uint id) public view returns (uint, string memory, Status){
    require(id < nextId , "Todo with given ID does not exist");
    Todo memory todo = todos[id];
    return (todo.id, todo.content, todo.status);
}





 }

 

