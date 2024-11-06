// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MiniSocial{
    event NewPostEvent(string Message, address PostOwner, uint PostTime, uint PostId);

    struct Post{
        uint id;
        string message;
        address author;
        uint num_likes;
    }

    Post[] private Posts;

    function GetPostAuthor(uint id) public view returns(address) {
        return Posts[id].author;
    }
    function GetPostLikes(uint id) public view returns(uint){
        return Posts[id].num_likes;
    }

    function getTotalPosts() public view returns(uint) {
        return Posts.length;
    }
    function GetPosts() public view returns(Post[] memory) {
        return Posts;
    }
    function getPost(uint index) public view returns (string memory, address){
        return (Posts[index].message,Posts[index].author);
    }
    function addLike(uint id) public {
        Posts[id].num_likes++;
    }
    function publishPost(string memory _message) public {
        require(keccak256(abi.encodePacked(_message)) != keccak256(abi.encodePacked("")), "Post cannot be empty.");
        require(bytes(_message).length <= 140, "Post is too long.");
        uint index = Posts.length + 1;
        uint num_likes;
        address author = msg.sender;
        Posts.push(Post(index,_message, author,num_likes));
    }



}
