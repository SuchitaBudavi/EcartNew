/*AngularJS for ManageProfile etc*/

var app = angular.module("userProfile",["ngRoute"])
				.config(function($routeProvider){
					$routeProvider
					.when("/changePwd",{
						templateUrl: "userChangePassword.jsp",
						controller: "changePasswordController"
					})
					
				})
				.controller("changePasswordController", function($scope){
					$scope.message = "hello!!!";
				})